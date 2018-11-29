//
//  ViewController.swift
//  SpinWheelExample
//
//  Created by Josh Henry on 5/17/17.
//  Copyright © 2017 Big Smash Software. All rights reserved.
//

import UIKit
import SpinWheelControl
class ViewController: UIViewController, SpinWheelControlDataSource, SpinWheelControlDelegate {
    let colorPalette: [UIColor] = [UIColor.blue, UIColor.brown, UIColor.cyan, UIColor.darkGray, UIColor.green, UIColor.magenta, UIColor.red, UIColor.orange, UIColor.black, UIColor.gray, UIColor.lightGray, UIColor.purple, UIColor.yellow, UIColor.white]

    
    func wedgeForSliceAtIndex(index: UInt) -> SpinWheelWedge {
        let wedge = CustomSpinWheelWedge()
        
        wedge.shape.fillColor = colorPalette[Int(index)].cgColor
        wedge.label.text = " " + String(index)
        let view = UIView(frame: CGRect(x: 0, y: 10 , width: 50, height: 50))
        view.backgroundColor = .green
       wedge.customSpin.backgroundColor = colorPalette[Int(index)]

        return wedge
    }

    
    var spinWheelControl:SpinWheelControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
        spinWheelControl = SpinWheelControl(frame: frame)
        spinWheelControl.addTarget(self, action: #selector(spinWheelDidChangeValue), for: UIControlEvents.valueChanged)
        
        spinWheelControl.dataSource = self
        spinWheelControl.reloadData()
        
        spinWheelControl.delegate = self
        
        self.view.addSubview(spinWheelControl)
    }
    
    
    func numberOfWedgesInSpinWheel(spinWheel: SpinWheelControl) -> UInt {
        return 6
    }
    
    
    //Target was added in viewDidLoad for the valueChanged UIControlEvent
    func spinWheelDidChangeValue(sender: AnyObject) {
        
        print("Value changed to " + String(self.spinWheelControl.selectedIndex) )
        self.spinWheelControl.spinWheelView.subviews.forEach { (view) in
            guard let custom = view as? CustomSpinWheelWedge else {return}
            custom.isActive = false
        }
        
        let view = self.spinWheelControl.spinWheelView.subviews[self.spinWheelControl.selectedIndex] as! CustomSpinWheelWedge
        view.isActive = true
        
        
    }
    
    
    func spinWheelDidEndDecelerating(spinWheel: SpinWheelControl) {
        print("The spin wheel did end decelerating.")
    }
    
    
    func spinWheelDidRotateByRadians(radians: Radians) {
        
        print("The wheel did rotate this many radians - " + String(describing: radians))
    }
}

