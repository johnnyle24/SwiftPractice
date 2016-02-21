//
//  ColorBand.swift
//  Brush Chooser
//
//  Created by Johnny Le on 2/9/16.
//  Copyright © 2016 Johnny Le. All rights reserved.
//

import Foundation

import UIKit

//The Gradient that gets toggled on and off
class ColorBand: UIControl {
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let context: CGContext? = UIGraphicsGetCurrentContext()
        
        // Gradient!
        let currentContext = UIGraphicsGetCurrentContext()
        
        CGContextSaveGState(currentContext);
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        let redColor = UIColor.redColor()
        let redColorComponents = CGColorGetComponents(redColor.CGColor)
        let orangeColor = UIColor.orangeColor()
        let orangeColorComponents = CGColorGetComponents(orangeColor.CGColor)
        let yellowColor = UIColor.yellowColor()
        let yellowColorComponents = CGColorGetComponents(yellowColor.CGColor)
        let greenColor = UIColor.greenColor()
        let greenColorComponents = CGColorGetComponents(greenColor.CGColor)
        let blueColor = UIColor.blueColor()
        let blueColorComponents = CGColorGetComponents(blueColor.CGColor)
        let purpleColor = UIColor.purpleColor()
        let purpleColorComponents = CGColorGetComponents(purpleColor.CGColor)
        
        var colorComponents
        = [redColorComponents[0], redColorComponents[1], redColorComponents[2], redColorComponents[3], orangeColorComponents[0], orangeColorComponents[1], orangeColorComponents[2], orangeColorComponents[3], yellowColorComponents[0], yellowColorComponents[1], yellowColorComponents[2], yellowColorComponents[3], greenColorComponents[0], greenColorComponents[1], greenColorComponents[2], greenColorComponents[3], blueColorComponents[0], blueColorComponents[1], blueColorComponents[2], blueColorComponents[3], purpleColorComponents[0], purpleColorComponents[1], purpleColorComponents[2], purpleColorComponents[3]]
        
        var locations:[CGFloat] = [0.0, 0.2, 0.4, 0.6, 0.8, 1.0]
        
        let gradient = CGGradientCreateWithColorComponents(colorSpace,&colorComponents,&locations,6)
        
        let startPoint = CGPointMake(0.0, self.bounds.height*0.5)
        let endPoint = CGPointMake(self.bounds.width, self.bounds.height*0.5)
        
        let option: CGGradientDrawingOptions = CGGradientDrawingOptions()
        
        CGContextDrawLinearGradient(currentContext,gradient,startPoint,endPoint, option)
        
        CGContextRestoreGState(currentContext);
        
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
    
    func reloadData() {
        self.setNeedsDisplay()
    }
    
}