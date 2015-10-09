//
//  DrawView.swift
//  NIMHANS
//
//  Created by Jaison Titus on 09/10/15.
//  Copyright © 2015 foofys. All rights reserved.
//

import UIKit

protocol DrawViewDelegate {
    func startedDrawing()
    func stoppedDrawing()
}

class DrawView: UIView {
    
    var lines: [Line] = []
    var lastPoint: CGPoint!
    
    var delegate: DrawViewDelegate?

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.backgroundColor = UIColor.whiteColor()

    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let delegate = self.delegate {
            delegate.startedDrawing()
        }
        if let touch = touches.first {
            lastPoint = touch.locationInView(self)
        }
        super.touchesBegan(touches , withEvent:event)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first  {
            let newPoint = touch.locationInView(self)
            lines.append(Line(start: lastPoint, end: newPoint))
            lastPoint = newPoint
        }
        super.touchesBegan(touches , withEvent:event)
        self.setNeedsDisplay()
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let delegate = self.delegate {
            delegate.stoppedDrawing()
        }
    }
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextBeginPath(context)
        for line in lines {
            CGContextMoveToPoint(context, line.start.x, line.start.y)
            CGContextAddLineToPoint(context, line.end.x, line.end.y)
        }
        CGContextSetLineCap(context, kCGLineCapRound)
        CGContextSetRGBStrokeColor(context, 0, 0, 0, 1)
        CGContextSetLineWidth(context, 5)
        CGContextStrokePath(context)
    }
    

}
