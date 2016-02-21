//
//  FrontPanel.swift
//  Brush Chooser
//
//  Created by Johnny Le on 2/9/16.
//  Copyright © 2016 Johnny Le. All rights reserved.
//

import Foundation

import UIKit

/*
    A place holder for a future subview and only is used for borders at the moment
*/
class FrontPanel: UIView {
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let context: CGContext? = UIGraphicsGetCurrentContext()
        
        let lineWidth: CGFloat = 5
        
        var rectRect: CGRect = CGRectZero
        rectRect.size.width = bounds.width
        rectRect.size.height = bounds.height
        rectRect.origin.x = 0.0
        rectRect.origin.y = 0.0
    
        UIColor.darkGrayColor().setStroke()
        
        CGContextAddRect(context, rectRect)
        CGContextSetLineWidth(context, lineWidth)
        CGContextStrokePath(context)
        
        
    }
}