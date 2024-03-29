//
//  DrawView.swift
//  NIMHANS
//
//  Created by Jaison Titus on 09/10/15.
//  Copyright © 2015 foofys. All rights reserved.
//

import UIKit

class DrawView: UIView {
    
    var lines: [Line] = []
    var lastPoint: CGPoint!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.lightGrayColor()

    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            lastPoint = touch.locationInView(self)
            lines.append(Line(start: lastPoint, end: lastPoint))
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
    
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextBeginPath(context)
        for line in lines {
            CGContextMoveToPoint(context, line.start.x, line.start.y)
            CGContextAddLineToPoint(context, line.end.x, line.end.y)
        }
        CGContextSetLineCap(context, kCGLineCapRound)
        CGContextSetRGBStrokeColor(context, 0, 0, 0, 1)
        CGContextSetLineWidth(context, 2)
        CGContextStrokePath(context)
    }
    
    func setDisplay() {
        setNeedsDisplay()
    }
    

}
