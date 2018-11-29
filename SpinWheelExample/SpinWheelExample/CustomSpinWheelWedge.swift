//
//  CustomSpinWheelWedge.swift
//  SpinWheelExample
//
//  Created by Amir Ardalan on 10/1/18.
//  Copyright © 2018 Big Smash Software. All rights reserved.
//

import Foundation
import SpinWheelControl
class CustomSpinWheelWedge: SpinWheelWedge {
    lazy var customSpin = CustomSpin()
    override var customView: SpinWheelWedgeView {
        get{
           return customSpin
        }
        set{
            customSpin = newValue as! CustomSpin
        }

    }
    
    var isActive : Bool = false{
        didSet{
            self.customSpin.subviews.first?.alpha = isActive ? 1 : 0.4
        }
    }
}
