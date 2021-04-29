//
//  PlayViewController.swift
//  KelistrikanBodyMotor
//
//  Created by Muhammad Firdaus on 28/04/21.
//

import UIKit

class PlayViewController: UIViewController {
    
    var type : Judul?
    var isLampOn = false
    var isComplete = false
    
    let netralLampImage = UIImageView()
    let portNetralLamp = UIView().asCircle(x: 155, y : 602,width : 18, height : 18)
    let portNetralLamp2 = UIView().asCircle(x: 155, y : 555,width : 18, height : 18)
    
    let portStopContact = UIView().asCircle(x: 302, y : 602,width : 18, height : 18)
    let portStopContact2 = UIView().asCircle(x: 265, y : 602,width : 18, height : 18)
    
    let portFuse = UIView().asCircle(x: 266, y : 267,width : 18, height : 18)
    let portFuse2 = UIView().asCircle(x: 303, y : 267,width : 18, height : 18)
    
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
    
    lazy var panRecognizerNetralLamp: GestureModel = {
        return GestureModel(target: self, action: #selector(panGestureCalled(gestureModel:)))
    }()
    
    lazy var panRecognizerStopContact: GestureModel = {
        return GestureModel(target: self, action: #selector(panGestureCalled(gestureModel:)))
    }()
    
    lazy var panRecognizerFuse: GestureModel = {
        return GestureModel(target: self, action: #selector(panGestureCalled(gestureModel:)))
    }()
    
    lazy var panRecognizerSwitch: GestureModel = {
        return GestureModel(target: self, action: #selector(panGestureCalled(gestureModel:)))
    }()
    
    lazy var panRecognizerAccu2: GestureModel = {
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
                checkComplete()
            } else {
                gestureModel.isConnect = true
                self.view.layer.addSublayer(gestureModel.lineShapeConnect)
                checkComplete()
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        makeSwitch(type: type)
        makeFuse()
        makeAccu(type: type)
        makeStopContact()
        makeNetralLamp()
    }
    
    func makeNetralLamp(){
        var portIGLabel = UILabel()
        
        netralLampImage.frame = CGRect(x: 48, y: 564, width: 77.36, height: 58)
        netralLampImage.image = UIImage(named: "lamp-n-off.png")
        
        portIGLabel = portIGLabel.makePortName(value: "IG", dot: portNetralLamp, position: .bottom)
        
        view.addSubview(portIGLabel)
        view.addSubview(portNetralLamp)
        view.addSubview(portNetralLamp2)
        view.addSubview(netralLampImage)
        
        panRecognizerNetralLamp.startObject = portNetralLamp2
        panRecognizerNetralLamp.finishObject = portSwitch2
        portNetralLamp2.addGestureRecognizer(panRecognizerNetralLamp)
    }
    
    func makeStopContact(){
        let stopContactImage = UIImageView()
        var portBLabel = UILabel()
        var portIGLabel = UILabel()
        
        stopContactImage.frame = CGRect(x: 232.68, y: 655, width: 133.38, height: 100)
        stopContactImage.image = UIImage(named: "stopcontact.png")
        
        portBLabel = portBLabel.makePortName(value: "B", dot: portStopContact, position: .bottom)
        portIGLabel = portIGLabel.makePortName(value: "IG", dot: portStopContact2, position: .bottom)
        
        view.addSubview(portBLabel)
        view.addSubview(portIGLabel)
        view.addSubview(portStopContact)
        view.addSubview(portStopContact2)
        view.addSubview(stopContactImage)
        
        panRecognizerStopContact.startObject = portStopContact2
        panRecognizerStopContact.finishObject = portNetralLamp
        portStopContact2.addGestureRecognizer(panRecognizerStopContact)
    }
    
    func makeFuse(){
        let fuseImage = UIImageView()
        var portFuseGround = UILabel()
        
        fuseImage.frame = CGRect(x: 233, y: 148, width: 133.38, height: 100)
        fuseImage.image = UIImage(named: "fuse-icon.png")
        
        portFuseGround = portFuseGround.makePortName(value: "G", dot: portFuse2, position: .top)
        
        view.addSubview(portFuseGround)
        view.addSubview(portFuse)
        view.addSubview(portFuse2)
        view.addSubview(fuseImage)
        
        panRecognizerFuse.startObject = portFuse2
        panRecognizerFuse.finishObject = portStopContact
        portFuse2.addGestureRecognizer(panRecognizerFuse)
    }
    
    func makeAccu(type : Judul?){
        accuImage.frame = CGRect(x: 19, y: 231.3, width: 121.54, height: 100)
        accuImage.image = UIImage(named: "accu.png")
        
        portCirclePositif = portCirclePositif.makePortName(value: "+", dot: portAccu)
        portCircleNegatif = portCircleNegatif.makePortName(value: "-", dot: portAccu2)
        
        view.addSubview(portCirclePositif)
        view.addSubview(portCircleNegatif)
        view.addSubview(portAccu)
        view.addSubview(portAccu2)
        view.addSubview(accuImage)
        
        panRecognizerAccu2.startObject = portAccu
        panRecognizerAccu2.finishObject = portFuse
        portAccu.addGestureRecognizer(panRecognizerAccu2)
    }
    
    func makeSwitch(type : Judul?){
        
        switchImage.frame = CGRect(x: 19, y: 383, width: 121.54, height: 100)
        switchImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickSwitch)))
        switchImage.isUserInteractionEnabled = true
        
        switch type {
            case .lampuNetral: do {
                switchImage.image = UIImage(named: "persneling.png")
            }
                
            case .klakson : do {
                switchImage.image = UIImage(named: "switch1.png")
                portSwitchLabel = portCirclePositif.makePortName(value: "E", dot: portSwitch)
                portSwitchLabel2 = portCircleNegatif.makePortName(value: "HR", dot: portSwitch2)
            }
                
            default:
                switchImage.image = UIImage(named: "persneling.png")
        }
        
        view.addSubview(portSwitchLabel)
        view.addSubview(portSwitchLabel2)
        view.addSubview(portSwitch)
        view.addSubview(portSwitch2)
        view.addSubview(switchImage)
        
        panRecognizerSwitch.startObject = portSwitch
        panRecognizerSwitch.finishObject = portAccu2
        portSwitch.addGestureRecognizer(panRecognizerSwitch)
    }
    
    func checkComplete() {
        switch type {
        case .lampuNetral:
            if (panRecognizerNetralLamp.isConnect && panRecognizerStopContact.isConnect && panRecognizerFuse.isConnect && panRecognizerSwitch.isConnect && panRecognizerAccu2.isConnect) {
              isComplete = true
            } else {
                isComplete = false
            }
        default:
            if (panRecognizerNetralLamp.isConnect && panRecognizerStopContact.isConnect && panRecognizerFuse.isConnect && panRecognizerSwitch.isConnect && panRecognizerAccu2.isConnect) {
              isComplete = true
            } else {
                isComplete = false
            }
        }
    }
    
    @objc func clickSwitch() {
        if isComplete {
            if isLampOn {
                isLampOn = false
                netralLampImage.image = UIImage(named: "lamp-n-off.png")
            } else {
                isLampOn = true
                netralLampImage.image = UIImage(named: "lamp-n-on.png")
            }
        }
    }
}


