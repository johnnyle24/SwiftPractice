//
//  knobBankView.swift
//  Brush Chooser
//
//  Created by Johnny Le on 2/8/16.
//  Copyright © 2016 Johnny Le. All rights reserved.
//

import UIKit

class KnobBankView: UIView {
    
    //Controls various values such as labels and border colors
    var borderColor: UIColor = UIColor.blackColor()
    var borderWidth: CGFloat = 5
    var knobSize: CGFloat { return self.bounds.height*0.6 }
    var wLabel: UILabel!
    var cLabel: UILabel!
    var jLabel: UILabel!
    var coLabel: UILabel!
    var tLabel: UILabel!
    
    //Allows for even spacing
    private var knobOriginY: CGFloat { return (self.bounds.height - knobSize) * 0.5 }
    
    //Instantiates the knobs and switches
    var triSwitch: Triangle!
    var widthKnob: Knob!
    var capKnob: Knob!
    var joinKnob: Knob!
    var colorKnob: Knob!
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        if let context = UIGraphicsGetCurrentContext() {
            
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
            
            var locations:[CGFloat] = [0.2, 0.3, 0.4, 0.5, 0.6, 0.7]
            
            let gradient = CGGradientCreateWithColorComponents(colorSpace,&colorComponents,&locations,6)
            
            let startPoint = CGPointMake(self.bounds.width, 0.0)
            let endPoint = CGPointMake(self.bounds.width, self.bounds.height)
            
            let option: CGGradientDrawingOptions = CGGradientDrawingOptions()
            
            CGContextDrawLinearGradient(currentContext,gradient,startPoint,endPoint, option)
            
            CGContextRestoreGState(currentContext);
            
            //Border and display of the rainbow
            
            borderColor.set()
            CGContextStrokeRectWithWidth(context, rect, borderWidth)
            
            CGContextMoveToPoint(context, 0.0, self.bounds.height*0.2)
            CGContextAddLineToPoint(context, self.bounds.width, self.bounds.height*0.5)
            CGContextAddLineToPoint(context, self.bounds.width, 0.0)
            CGContextAddLineToPoint(context, 0.0, 0.0)
            CGContextAddLineToPoint(context, 0.0, self.bounds.height*0.2)
            CGContextSetFillColorWithColor(context, UIColor.blackColor().CGColor)
            CGContextFillPath(context)
            CGContextDrawPath(context, CGPathDrawingMode.Stroke)
            
            CGContextMoveToPoint(context, 0.0, self.bounds.height*0.8)
            CGContextAddLineToPoint(context, self.bounds.width, self.bounds.height*0.5)
            CGContextAddLineToPoint(context, self.bounds.width, self.bounds.height)
            CGContextAddLineToPoint(context, 0.0, self.bounds.height)
            CGContextAddLineToPoint(context, 0.0, self.bounds.height*0.8)
            CGContextSetFillColorWithColor(context, UIColor.blackColor().CGColor)
            CGContextFillPath(context)
            CGContextDrawPath(context, CGPathDrawingMode.FillStroke)
            
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
    
    //Places subviews on the screen
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let spacing: CGFloat = (self.bounds.width - (knobSize*5))/6
        
        var knobOriginX = spacing
        
        widthKnob.frame = CGRectMake(knobOriginX, knobOriginY, knobSize, knobSize)
        widthKnob.backgroundColor = UIColor.clearColor()
        widthKnob.addTarget(self, action: "knobValueChanged", forControlEvents: .ValueChanged)
        wLabel.text = "Width"
        wLabel.textColor = UIColor.whiteColor()
        wLabel.font = UIFont(name: "Courier New", size: CGFloat(12))
        wLabel.textAlignment = .Center
        
        knobOriginX += (spacing + knobSize)
        
        capKnob.frame = CGRectMake(knobOriginX, knobOriginY, knobSize, knobSize)
        cLabel.text = "Caps"
        cLabel.textColor = UIColor.whiteColor()
        cLabel.font = UIFont(name: "Courier New", size: CGFloat(12))
        cLabel.textAlignment = .Center
        
        capKnob.backgroundColor = UIColor.clearColor()
        
        knobOriginX += (spacing + knobSize)
        
        joinKnob.frame = CGRectMake(knobOriginX, knobOriginY, knobSize, knobSize)
        jLabel.text = "Join"
        jLabel.textColor = UIColor.whiteColor()
        jLabel.font = UIFont(name: "Courier New", size: CGFloat(12))
        jLabel.textAlignment = .Center
        
        joinKnob.backgroundColor = UIColor.clearColor()
        
        knobOriginX += (spacing + knobSize)
        
        colorKnob.frame = CGRectMake(knobOriginX, knobOriginY, knobSize, knobSize)
        coLabel.text = "Opacity"
        coLabel.textColor = UIColor.whiteColor()
        coLabel.font = UIFont(name: "Courier New", size: CGFloat(12))
        coLabel.textAlignment = .Left
        
        colorKnob.backgroundColor = UIColor.clearColor()
        
        knobOriginX += (spacing + knobSize)
        
        triSwitch.frame = CGRectMake(knobOriginX, knobOriginY, knobSize, knobSize)
        tLabel.text = "Toggle"
        tLabel.textColor = UIColor.whiteColor()
        tLabel.font = UIFont(name: "Courier New", size: CGFloat(12))
        tLabel.textAlignment = .Center
        
        triSwitch.backgroundColor = UIColor.clearColor()
    }
    
    //Func for tracking the value of the knob
    func knobValueChanged() {
        print("knob angle changed to: \(widthKnob?.angle)")
    }
    
    //An initialization function
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    //Goes with the function above to supply a super of the decoder
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    //The actual setup function called in the init
    private func setup() {
        
        widthKnob = Knob()
        capKnob = Knob()
        joinKnob = Knob()
        colorKnob = Knob()
        triSwitch = Triangle()
        wLabel = UILabel(frame: CGRect(x: (self.bounds.width - (knobSize*5))/6, y: 0.0, width: 50.0, height: 20.0))
        cLabel = UILabel(frame: CGRect(x: 2*(self.bounds.width - (knobSize*5))/6+knobSize, y: 0.0, width: 50.0, height: 20.0))
        jLabel = UILabel(frame: CGRect(x: 3*(self.bounds.width - (knobSize*5))/6+knobSize*2, y: 0.0, width: 50.0, height: 20.0))
        coLabel = UILabel(frame: CGRect(x: 4*(self.bounds.width - (knobSize*5))/6+knobSize*3, y: 0.0, width: 50.0, height: 20.0))
        tLabel = UILabel(frame: CGRect(x: 5*(self.bounds.width - (knobSize*5))/6+knobSize*4-10.0, y: 0.0, width: 70.0, height: 20.0))
        
        super.addSubview(widthKnob)
        super.addSubview(capKnob)
        super.addSubview(joinKnob)
        super.addSubview(colorKnob)
        super.addSubview(triSwitch)
        super.addSubview(wLabel)
        super.addSubview(cLabel)
        super.addSubview(jLabel)
        super.addSubview(coLabel)
        super.addSubview(tLabel)
        
    }
}
