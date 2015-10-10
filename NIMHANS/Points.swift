//
//  Points.swift
//  NIMHANS
//
//  Created by Jaison Titus on 10/10/15.
//  Copyright © 2015 foofys. All rights reserved.
//

import Foundation
class Points {
    
    var startX: Float?
    var startY: Float?
    var endX: Float?
    var endY: Float?
    
    init(data: LinePoints) {
        self.startX = data.startX as? Float
        self.startY = data.startY as? Float
        self.endX = data.endX as? Float
        self.endY = data.endY as? Float
    }
}