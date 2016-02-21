//
//  AppDelegate.swift
//  Brush Chooser
//
//  Created by Johnny Le on 2/8/16.
//  Copyright © 2016 Johnny Le. All rights reserved.
//

import UIKit
import Foundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    //Instantiates the various views/content to be displayed
    
    var window: UIWindow?
    
    var rSlider: UISlider!
    var bSlider: UISlider!
    var gSlider: UISlider!
    var rLabel: UILabel!
    var gLabel: UILabel!
    var bLabel: UILabel!
    
    //Controls the preview screen and gradient
    var band: ColorBand!
    var preview: Preview!
    var controlsViewController: UIViewController!
    var grad: Bool! = true
    
    //Displays the knobs
    private var knobBank: KnobBankView!
    private var widthAngle: Double = 0.0
    
    //Allows the knobs to be evenly spaced
    private let knobSize: CGFloat = 73
    private let knobSpacing: CGFloat = 1
    private var knobInterval: CGFloat { return knobSpacing + knobSize }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        controlsViewController = UIViewController()
        controlsViewController.view.backgroundColor = UIColor.grayColor()
        
        //Used for outlining the knobBank
        
        let headBar: HeadBar = HeadBar(frame: CGRectMake(0.0, 20.0, 320.0, 548.0))
        headBar.backgroundColor = UIColor.whiteColor()
        controlsViewController.view.addSubview(headBar)
        
        //FrontPanel in which Preview and others will appear
        
        let front: FrontPanel = FrontPanel(frame: CGRectMake(5.0, 110.0, 310.0, 438.0))
        front.backgroundColor = UIColor.blackColor()
        controlsViewController.view.addSubview(front)

        //The Bank of Knobs
        
        knobBank = KnobBankView(frame: CGRectMake(5.0, 25.0, 310.0, 80.0))
        knobBank.backgroundColor = UIColor.blackColor()
        knobBank.widthKnob.addTarget(self, action: "widthKnobTurned", forControlEvents: .ValueChanged)
        knobBank.capKnob.addTarget(self, action: "capKnobTurned", forControlEvents: .ValueChanged)
        knobBank.joinKnob.addTarget(self, action: "joinKnobTurned", forControlEvents: .ValueChanged)
        knobBank.colorKnob.addTarget(self, action: "colorKnobTurned", forControlEvents: .ValueChanged)
        knobBank.triSwitch.addTarget(self, action: "switchFlipped", forControlEvents: .ValueChanged)
        controlsViewController.view.addSubview(knobBank)
        
        //Color gradient
        
        band = ColorBand(frame: CGRectMake(20.0, 125.0, 280.0, 180.0))
        band.backgroundColor = UIColor.blackColor()
        createSliders()
        
        //Preview screen
        
        preview = Preview(frame: CGRectMake(20.0, 325.0, 280.0, 210.0))
        preview.backgroundColor = UIColor.grayColor()
        controlsViewController.view.addSubview(preview)
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = controlsViewController
        window?.makeKeyAndVisible()
        
        return true
    }

    //Creates the sliders and places them on the screen
    func createSliders(){
        rSlider = UISlider(frame: CGRectMake(20, 125, 280, 80))
        rSlider.value = Float(preview.red)
        rSlider.addTarget(self, action: "SliderChanged", forControlEvents: UIControlEvents.ValueChanged)
        controlsViewController.view.addSubview(rSlider)
        rLabel = UILabel(frame: CGRect(x: 20, y: 125, width: 280, height: 80.0))
        rLabel.text = "Red"
        rLabel.textColor = UIColor.redColor()
        rLabel.font = UIFont(name: "Courier New", size: CGFloat(24))
        rLabel.textAlignment = .Center
        controlsViewController.view.addSubview(rLabel)
        
        bSlider = UISlider(frame: CGRectMake(20, 175, 280, 80))
        bSlider.value = Float(preview.blue)
        bSlider.addTarget(self, action: "SliderChanged", forControlEvents: UIControlEvents.ValueChanged)
        controlsViewController.view.addSubview(bSlider)
        bLabel = UILabel(frame: CGRect(x: 20, y: 175, width: 280, height: 80.0))
        bLabel.text = "Blue"
        bLabel.textColor = UIColor.blueColor()
        bLabel.font = UIFont(name: "Courier New", size: CGFloat(24))
        bLabel.textAlignment = .Center
        controlsViewController.view.addSubview(bLabel)
        
        gSlider = UISlider(frame: CGRectMake(20, 225, 280, 80))
        gSlider.value = Float(preview.green)
        gSlider.addTarget(self, action: "SliderChanged", forControlEvents: UIControlEvents.ValueChanged)
        controlsViewController.view.addSubview(gSlider)
        gLabel = UILabel(frame: CGRect(x: 20, y: 225, width: 280, height: 80.0))
        gLabel.text = "Green"
        gLabel.textColor = UIColor.greenColor()
        gLabel.font = UIFont(name: "Courier New", size: CGFloat(24))
        gLabel.textAlignment = .Center
        controlsViewController.view.addSubview(gLabel)
    }
    
    //Removes the sliders from the screen
    func deleteSliders(){
        rSlider.removeFromSuperview()
        rLabel.removeFromSuperview()
        bSlider.removeFromSuperview()
        bLabel.removeFromSuperview()
        gSlider.removeFromSuperview()
        gLabel.removeFromSuperview()
    }
    
    //Adjusts the color values with changes to the sliders
    func SliderChanged ()
    {
        
        let r: CGFloat = CGFloat(rSlider.value)
        let g: CGFloat = CGFloat(gSlider.value)
        let b: CGFloat = CGFloat(bSlider.value)
        
        preview.setColor(r, g: g, b: b)
    }
    
    //Varies the widthknob sending a positive or negative value depening on the angle
    func widthKnobTurned()
    {
        var newWidth: Double = 0.5
        
        if (knobBank.widthKnob.angle < 0)
        {
            newWidth *= -1
        }
        else
        {
            newWidth *= 1
        }
        
        preview.setWidth(newWidth)
    }
    
    //Depending on the angle, will return one of three caps
    func capKnobTurned()
    {
        let newCap: CGLineCap!
        if (abs(knobBank.capKnob.angle) < 1)
        {
            newCap = CGLineCap.Butt
        }
        else if (abs(knobBank.capKnob.angle) < 2)
        {
            newCap = CGLineCap.Round
        }
        else
        {
            newCap = CGLineCap.Square
        }
        
        preview.setCap(newCap)
    }
    
    
    //Changes the joints of the drawing
    func joinKnobTurned()
    {
        let newJoin: CGLineJoin!
        if (abs(knobBank.joinKnob.angle) < 1)
        {
            newJoin = CGLineJoin.Bevel
        }
        else if (abs(knobBank.joinKnob.angle) < 2)
        {
            newJoin = CGLineJoin.Round
        }
        else
        {
            newJoin = CGLineJoin.Miter
        }
        
        preview.setJoin(newJoin)
    }
    
    //Actually changes the opacity of the drawing
    func colorKnobTurned()
    {
        let hue2 = (knobBank.colorKnob.angle + M_PI)/(M_PI*2)
        
        preview.setColorHue(CGFloat(hue2))
    }
    
    //Toggles the slider and the gradient view
    func switchFlipped()
    {
        grad = !grad
        if (grad == true)
        {
            band.removeFromSuperview()
            createSliders()
        }
        else
        {
            deleteSliders()
            controlsViewController.view.addSubview(band)
        }
        
    }
    


    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

