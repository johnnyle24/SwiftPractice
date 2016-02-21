//
//  Knob.swift
//  Brush Chooser
//
//  Created by Johnny Le on 2/8/16.
//  Copyright © 2016 Johnny Le. All rights reserved.
//

import UIKit

class Knob: UIControl {
    private var _angle: Double = M_PI / 6.0
    private var _knobRect: CGRect = CGRectZero
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        let touch: UITouch = touches.first!
        let touchPoint: CGPoint = touch.locationInView(self)
        print("Begin point: (\(touchPoint.x),\(touchPoint.y))")
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        let touch: UITouch = touches.first!
        let touchPoint:CGPoint = touch.locationInView(self)
        print("Move point: (\(touchPoint.x),\touchPOint.y))")
        
        let touchAngle: Double = atan2(Double(touchPoint.y - _knobRect.midY), Double (touchPoint.x - _knobRect.midX))
        angle = touchAngle
        
        print("Angle: (\(angle))")
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        let touch: UITouch = touches.first!
        let touchPoint: CGPoint = touch.locationInView(self)
        print("End Point: (\(touchPoint.x),\(touchPoint.y))")
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let context: CGContext? = UIGraphicsGetCurrentContext()
        
        let lineWidth: CGFloat = 3
        let increment: CGFloat = 5
        let lineWidth2: CGFloat = 0.1
//        let knobRect: CGRect = CGRectMake(lineWidth * 0.5, lineWidth * 0.5, bounds.width - lineWidth, bounds.width - lineWidth)
        
        
        //The KNOB Circle
        
        _knobRect.size.width = bounds.width
        _knobRect.size.height = _knobRect.size.width
        _knobRect.origin.x = 0.0
        _knobRect.origin.y = (bounds.height - _knobRect.height) * 0.5
        
        CGContextSetFillColorWithColor(context, UIColor.grayColor().CGColor)
        CGContextFillEllipseInRect(context, _knobRect)
        
        //Knob Inner Circles
        
        var knobRect2: CGRect = CGRectZero
        knobRect2.size.width = bounds.width - lineWidth
        knobRect2.size.height = knobRect2.size.width
        knobRect2.origin.x = lineWidth * 0.5
        knobRect2.origin.y = (bounds.height - knobRect2.height) * 0.5
        
        CGContextAddEllipseInRect(context, knobRect2)
        CGContextSetLineWidth(context, lineWidth)
        CGContextStrokePath(context)
        
        UIColor.darkGrayColor().setStroke() /////////////////////COLOR
        
        knobRect2.size.width -= increment
        knobRect2.size.height = knobRect2.size.width
        knobRect2.origin.x += (increment * 0.5)
        knobRect2.origin.y += (increment * 0.5)
        
        CGContextAddEllipseInRect(context, knobRect2)
        CGContextSetLineWidth(context, 0.5)
        CGContextStrokePath(context)
        
        knobRect2.size.width -= increment
        knobRect2.size.height = knobRect2.size.width
        knobRect2.origin.x += (increment * 0.5)
        knobRect2.origin.y += (increment * 0.5)
        
        CGContextAddEllipseInRect(context, knobRect2)
        CGContextSetLineWidth(context, lineWidth2)
        CGContextStrokePath(context)
        
        knobRect2.size.width -= increment
        knobRect2.size.height = knobRect2.size.width
        knobRect2.origin.x += (increment * 0.5)
        knobRect2.origin.y += (increment * 0.5)
        
        CGContextAddEllipseInRect(context, knobRect2)
        CGContextSetLineWidth(context, lineWidth2)
        CGContextStrokePath(context)
        
        knobRect2.size.width -= increment
        knobRect2.size.height = knobRect2.size.width
        knobRect2.origin.x += (increment * 0.5)
        knobRect2.origin.y += (increment * 0.5)
        
        CGContextAddEllipseInRect(context, knobRect2)
        CGContextSetLineWidth(context, lineWidth2)
        CGContextStrokePath(context)
        
        knobRect2.size.width -= increment
        knobRect2.size.height = knobRect2.size.width
        knobRect2.origin.x += (increment * 0.5)
        knobRect2.origin.y += (increment * 0.5)
        
        CGContextAddEllipseInRect(context, knobRect2)
        CGContextSetLineWidth(context, lineWidth2)
        CGContextStrokePath(context)
        
        knobRect2.size.width -= (increment * 2)
        knobRect2.size.height = knobRect2.size.width
        knobRect2.origin.x += (increment)
        knobRect2.origin.y += (increment)
        
        UIColor.darkGrayColor().setStroke()
        
        CGContextAddEllipseInRect(context, knobRect2)
        CGContextSetLineWidth(context, lineWidth2)
        CGContextStrokePath(context)
        
        //Knob Circle
        
//        let originX: CGFloat = _knobRect.width/2
//        let originY: CGFloat = _knobRect.height/2
        
        //Knob Circle Angle Calculator
        
        let knobRadius: CGFloat = _knobRect.width * 0.39
        var nibCenter: CGPoint = CGPointZero
        nibCenter.x = _knobRect.midX + knobRadius * CGFloat(cos(_angle)) - lineWidth*0.2
        nibCenter.y = _knobRect.midY + knobRadius * CGFloat(sin(_angle)) - lineWidth*0.2
        
        var nibRect: CGRect = CGRectZero
        nibRect.size.width = _knobRect.width*0.2
        nibRect.size.height = nibRect.size.width
        nibRect.origin.x = nibCenter.x - nibRect.size.width * 0.5
        nibRect.origin.y = nibCenter.y - nibRect.size.height * 0.5
        
        CGContextSetFillColorWithColor(context, UIColor.blackColor().CGColor)
        CGContextFillEllipseInRect(context, nibRect)
        
        // Knob Line
        
//        CGContextMoveToPoint(context, originX, originY)
//        CGContextAddLineToPoint(context, nibRect.origin.x, nibRect.origin.y)
//        CGContextDrawPath(context, CGPathDrawingMode.Stroke)
        
        CGContextAddEllipseInRect(context, nibRect)
        CGContextSetFillColorWithColor(context, UIColor.clearColor().CGColor)
        CGContextFillPath(context)
        
        
        //TODO: Create Gradient for Knobs
        
    }
    
    var angle: Double {
        get { return _angle }
        set{
            _angle = newValue
            sendActionsForControlEvents(.ValueChanged)
            setNeedsDisplay()
        }
    }
}
