//
//  FrontPanel.swift
//  Brush Chooser
//
//  Created by Johnny Le on 2/9/16.
//  Copyright © 2016 Johnny Le. All rights reserved.
//

import Foundation
//
//  Handle.swift
//  Brush Chooser
//
//  Created by Johnny Le on 2/8/16.
//  Copyright © 2016 Johnny Le. All rights reserved.
//

import UIKit

class Preview: UIView {
    var red: CGFloat = 1.0
    var green: CGFloat = 1.0
    var blue: CGFloat = 1.0
    private var hue: CGFloat = 1.0
    
    private var color = UIColor.whiteColor().CGColor
    private var join: CGLineJoin = CGLineJoin.Round
    private var cap: CGLineCap = CGLineCap.Round
    var lineWidth: Double = 5.0
    private var xBegin: CGFloat!
    private var yBegin: CGFloat!
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let context: CGContext? = UIGraphicsGetCurrentContext()
        
//        var rectRect: CGRect = CGRectZero
//        rectRect.size.width = bounds.width
//        rectRect.size.height = bounds.height
//        rectRect.origin.x = 0.0
//        rectRect.origin.y = 0.0
        
        //Line for Previewing!
        xBegin = self.bounds.width*0.2
        yBegin = self.bounds.height*0.5
        
//        CGContextAddRect(context, rectRect)
//        CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
//        CGContextFillRect(context, rectRect)
        
        CGContextMoveToPoint(context, xBegin, yBegin)
        CGContextAddLineToPoint(context, 90.0, 40.0)
        CGContextAddLineToPoint(context, 100.0, 80.0)
        CGContextAddLineToPoint(context, 140.0, 30.0)
        CGContextAddLineToPoint(context, 100.0, 120.0)
        CGContextAddLineToPoint(context, 170.0, 120.0)
        CGContextAddLineToPoint(context, 200.0, 180.0)
        CGContextAddLineToPoint(context, 70.0, 70.0)
        
        //CGContextSetStrokeColorSpace(context, CGColorSpaceCreateDeviceRGB())
        CGContextSetStrokeColorWithColor(context,
            color)
        
        CGContextSetLineJoin(context, join)
        CGContextSetLineCap(context, cap)
        CGContextSetLineWidth(context, CGFloat(lineWidth))
    
        CGContextStrokePath(context)
        
    }
    
    func setColorHue(hue2: CGFloat){
        hue = hue2
        
        color = UIColor(red: red, green: green, blue: blue, alpha: hue).CGColor
        setNeedsDisplay()
    }
    
    func setColor(r: CGFloat, g: CGFloat, b: CGFloat) {
        red = r
        green = g
        blue = b
        
        color =  UIColor(red: red, green: green, blue: blue, alpha: hue).CGColor
        setNeedsDisplay()
    }
    
    func setJoin(newjoin: CGLineJoin){
        join = newjoin
        setNeedsDisplay()
    }
    
    func setCap(newCap: CGLineCap){
        cap = newCap
        setNeedsDisplay()
    }
    
    
    func setWidth(value: Double){
        print("The Hue is  \(value)")
        
        lineWidth += value
        
        if (lineWidth < 0.5) {
            lineWidth = 0.5
        }
        else if (lineWidth > 50.0){
            lineWidth = 50.0
        }
        
        setNeedsDisplay()
    }
    
}