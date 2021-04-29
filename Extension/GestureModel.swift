//
//  GestureModel.swift
//  KelistrikanBodyMotor
//
//  Created by Muhammad Firdaus on 29/04/21.
//

import Foundation
import UIKit

class GestureModel : UIPanGestureRecognizer {
    var startObject  = UIView()
    var finishObject = UIView()
    var isConnect = false
    
    lazy var lineShapeTemp: CAShapeLayer = {
        let lineShape = CAShapeLayer()
        lineShape.borderWidth = 1
        lineShape.borderColor = UIColor.gray.cgColor
        lineShape.strokeColor = UIColor.black.cgColor
        lineShape.lineWidth = 2.0
        return lineShape
    }()
    
    lazy var lineShapeConnect: CAShapeLayer = {
        let lineShape = CAShapeLayer()
        lineShape.borderWidth = 1
        lineShape.borderColor = UIColor.gray.cgColor
        lineShape.strokeColor = UIColor.black.cgColor
        lineShape.lineWidth = 2.0
        return lineShape
    }()

}
