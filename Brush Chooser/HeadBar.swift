//
//  Handle.swift
//  Brush Chooser
//
//  Created by Johnny Le on 2/8/16.
//  Copyright © 2016 Johnny Le. All rights reserved.
//

import UIKit

class HeadBar: UIView {
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let context: CGContext? = UIGraphicsGetCurrentContext()
        
        let lineWidth: CGFloat = 5
        
        var rectRect: CGRect = CGRectZero
        rectRect.size.width = bounds.width
        rectRect.size.height = bounds.height
        rectRect.origin.x = 0.0
        rectRect.origin.y = 0.0
        
        CGContextAddRect(context, rectRect)
        CGContextSetLineWidth(context, lineWidth)
        CGContextStrokePath(context)
        
        // Gradient!!!!!
        let currentContext = UIGraphicsGetCurrentContext()
        
        CGContextSaveGState(currentContext);
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        let startColor = UIColor.blackColor()
        let startColorComponents = CGColorGetComponents(startColor.CGColor)
        let midColor = UIColor.blackColor()
        let midColorComponents = CGColorGetComponents(midColor.CGColor)
        let endColor = UIColor.blackColor()
        let endColorComponents = CGColorGetComponents(endColor.CGColor)
        
        var colorComponents
        = [startColorComponents[0], startColorComponents[1], startColorComponents[2], startColorComponents[3], midColorComponents[0], midColorComponents[1], midColorComponents[2], midColorComponents[3], endColorComponents[0], endColorComponents[1], endColorComponents[2], endColorComponents[3]]
        
        var locations:[CGFloat] = [0.0, 0.5, 1.0]
        
        let gradient = CGGradientCreateWithColorComponents(colorSpace,&colorComponents,&locations,3)
        
        let startPoint = CGPointMake(0, self.bounds.height)
        let endPoint = CGPointMake(self.bounds.width, 0)
        
        let option: CGGradientDrawingOptions = CGGradientDrawingOptions()
        
        CGContextDrawLinearGradient(currentContext,gradient,startPoint,endPoint, option)
        
        //CGContextDrawRadialGradient(context, gradient, startPoint, 50, endPoint, 50, option)
        
        CGContextRestoreGState(currentContext);
    }
}