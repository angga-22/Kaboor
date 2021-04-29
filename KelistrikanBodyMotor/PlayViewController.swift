//
//  PlayViewController.swift
//  KelistrikanBodyMotor
//
//  Created by Muhammad Firdaus on 28/04/21.
//

import UIKit

class PlayViewController: UIViewController {
    
    let accuImage = UIImageView()
    let portAccu = UIView().asCircle(x: 155, y : 267,width : 18, height : 18)
    let portAccu2 = UIView().asCircle(x: 155, y : 304,width : 18, height : 18)
    var portCirclePositif = UILabel()
    var portCircleNegatif = UILabel()
    
    let switchImage = UIImageView()
    let portSwitch = UIView().asCircle(x: 155, y : 393,width : 18, height : 18)
    let portSwitch2 = UIView().asCircle(x: 155, y : 439,width : 18, height : 18)
    var portSwitchLabel = UILabel()
    var portSwitchLabel2 = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeAccu()
        makeSwitch()
    }
    
    func makeAccu(){
        accuImage.frame = CGRect(x: 19, y: 231.3, width: 121.54, height: 100)
        accuImage.image = UIImage(named: "accu.png")
        
        portCirclePositif = portCirclePositif.makePortName(value: "+", dot: portAccu)
        portCircleNegatif = portCircleNegatif.makePortName(value: "-", dot: portAccu2)
        
        view.addSubview(portCirclePositif)
        view.addSubview(portCircleNegatif)
        view.addSubview(portAccu)
        view.addSubview(portAccu2)
        view.addSubview(accuImage)
        
        panRecognizerAccu2.startObject = portAccu2
        panRecognizerAccu2.finishObject = portSwitch
        portAccu2.addGestureRecognizer(panRecognizerAccu2)
        
        panRecognizerAccu.startObject = portAccu
        panRecognizerAccu.finishObject = portSwitch2
        portAccu.addGestureRecognizer(panRecognizerAccu)
    }
    
    func makeSwitch(){
        switchImage.frame = CGRect(x: 19, y: 383, width: 121.54, height: 100)
        switchImage.image = UIImage(named: "switch1.png")
        
        portSwitchLabel = portCirclePositif.makePortName(value: "E", dot: portSwitch)
        portSwitchLabel2 = portCircleNegatif.makePortName(value: "HR", dot: portSwitch2)
        
        view.addSubview(portSwitchLabel)
        view.addSubview(portSwitchLabel2)
        view.addSubview(portSwitch)
        view.addSubview(portSwitch2)
        view.addSubview(switchImage)
        
        panRecognizerSwitch.startObject = portSwitch
        panRecognizerSwitch.finishObject = portAccu2
        portSwitch.addGestureRecognizer(panRecognizerSwitch)
    }
    
    // Setup line and gesture
    private lazy var panRecognizerSwitch: GestureModel = {
        return GestureModel(target: self, action: #selector(panGestureCalled(gestureModel:)))
    }()
    
    private lazy var panRecognizerAccu2: GestureModel = {
        return GestureModel(target: self, action: #selector(panGestureCalled(gestureModel:)))
    }()
    
    private lazy var panRecognizerAccu: GestureModel = {
        return GestureModel(target: self, action: #selector(panGestureCalled(gestureModel:)))
    }()
    
    @objc func panGestureCalled(gestureModel: GestureModel) {
        let linePathConnect = UIBezierPath()
        linePathConnect.move(to: gestureModel.startObject.center)
        linePathConnect.addLine(to: gestureModel.finishObject.center)
        gestureModel.lineShapeConnect.path = linePathConnect.cgPath
        
        let currentPanPoint = gestureModel.location(in: self.view)
        switch gestureModel.state {
        case .began:
            self.view.layer.addSublayer(gestureModel.lineShapeTemp)
            if gestureModel.isConnect {
                gestureModel.lineShapeConnect.path = nil
                gestureModel.lineShapeConnect.removeFromSuperlayer()
            }

        case .changed:
            let linePath = UIBezierPath()
            linePath.move(to: gestureModel.startObject.center)
            linePath.addLine(to: currentPanPoint)

            gestureModel.lineShapeTemp.path = linePath.cgPath
            
            gestureModel.finishObject.layer.borderWidth = hasDestine(gestureModel) ? 10 : 0
            gestureModel.finishObject.layer.borderColor = hasDestine(gestureModel) ? UIColor.green.cgColor : UIColor.clear.cgColor

        case .ended:
            if  (!hasDestine(gestureModel)) {
                gestureModel.lineShapeConnect.path = nil
                gestureModel.lineShapeConnect.removeFromSuperlayer()
                gestureModel.isConnect = false
            } else {
                gestureModel.isConnect = true
                self.view.layer.addSublayer(gestureModel.lineShapeConnect)
            }
            
            gestureModel.lineShapeTemp.path = nil
            gestureModel.lineShapeTemp.removeFromSuperlayer()
            gestureModel.finishObject.layer.borderWidth = 1
            gestureModel.finishObject.layer.borderColor = UIColor.gray.cgColor
        default: break
        }
    }

    func hasDestine(_ panRecognizer: GestureModel) -> Bool {
        let point = panRecognizer.location(in: panRecognizer.finishObject)
        return panRecognizer.finishObject.layer.contains(point)
    }
    
    func drawLine(startX: Int, toEndingX endX: Int, startingY startY: Int, toEndingY endY: Int, ofColor lineColor: UIColor, widthOfLine lineWidth: CGFloat, inView view: UIView) {

        let path = UIBezierPath()
        path.move(to: CGPoint(x: startX, y: startY))
        path.addLine(to: CGPoint(x: endX, y: endY))

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = lineWidth

        view.layer.addSublayer(shapeLayer)
    }
}
