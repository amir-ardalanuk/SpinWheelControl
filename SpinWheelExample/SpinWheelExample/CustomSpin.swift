//
//  CustomSpin.swift
//  SpinWheelExample
//
//  Created by Amir Ardalan on 10/1/18.
//  Copyright © 2018 Big Smash Software. All rights reserved.
//

import UIKit
import SpinWheelControl

class CustomSpin: SpinWheelWedgeView , Connectable{

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commit()
    }
    
    override func configureWedgeLabel(index: UInt, width: CGFloat, position: CGPoint, orientation: WedgeLabelOrientation, radiansPerWedge: Radians) {
        let size = width * 1.2
        frame = CGRect (x: 0, y: 0, width: size, height:size)
        
        self.layer.position = position
        if orientation == WedgeLabelOrientation.inOut {
            self.layer.anchorPoint = CGPoint(x: 1.1, y: 0.5)
            self.transform = CGAffineTransform(rotationAngle: radiansPerWedge * CGFloat(index) + CGFloat.pi + (radiansPerWedge / 2))
        }
        else if orientation == WedgeLabelOrientation.around {
            self.layer.anchorPoint = CGPoint(x: 0.5, y: 4.5)
            self.transform = CGAffineTransform(rotationAngle: radiansPerWedge * CGFloat(index) + (CGFloat.pi / 2) + (radiansPerWedge / 2))
        }
        for i in self.subviews.first!.subviews {
            i.transform = CGAffineTransform(rotationAngle: 3 * .pi / 2)
        }
    }


}
