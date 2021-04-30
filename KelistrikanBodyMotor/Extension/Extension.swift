//
//  Extension.swift
//  KelistrikanBodyMotor
//
//  Created by Muhammad Firdaus on 29/04/21.
//

import Foundation
import UIKit
import AVFoundation

var soundURI: URL?
var audioPlayer: AVAudioPlayer?

extension UIViewController {
    
    func playSound(file: String, fileExtension: String, isLoop: Bool = false){
        soundURI = URL(fileURLWithPath: Bundle.main.path(forResource: file, ofType: fileExtension)!)
        do {
            guard let uri = soundURI else {return}
            audioPlayer = try AVAudioPlayer(contentsOf: uri)
            audioPlayer?.play()
        } catch {
            print("something went wrong")
        }
    }
    
    func HornSound() {
        self.playSound(file: "horn-sound", fileExtension: "wav")
    }
}
extension UIView {
    func asCircle(x : Double, y: Double, width: Double, height : Double) -> UIView {
        let circle = UIView()
        circle.frame = CGRect(x: x, y : y,width : width, height : height)
        circle.layer.cornerRadius = circle.frame.width / 2;
        circle.layer.masksToBounds = true
        circle.backgroundColor = UIColor.black
        circle.layer.borderWidth = 1
        circle.layer.borderColor = UIColor.gray.cgColor
        return circle
    }
}

extension UILabel {
    func makePortName(value : String, dot : UIView, position : PositionLabelPort = .left) -> UILabel {
        switch position {
        case .top:
            let label = UILabel(frame: CGRect(x: dot.frame.origin.x - 6, y: dot.frame.origin.y - 24, width: 30, height: 21))
                label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 18.0)
                label.text = value
            return label
        case .bottom:
            let label = UILabel(frame: CGRect(x: dot.frame.origin.x - 6 , y: dot.frame.origin.y + 20, width: 30, height: 21))
                label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 18.0)
                label.text = value
            return label
        default:
            let label = UILabel(frame: CGRect(x: dot.frame.origin.x - 30 , y: dot.frame.origin.y - 3, width: 30, height: 21))
                label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 18.0)
                label.text = value
            return label
        }
    }
}

extension CGPath {
    class func barbell(from start: CGPoint, to end: CGPoint, barThickness proposedBarThickness: CGFloat, bellRadius proposedBellRadius: CGFloat) -> CGPath {
        let barThickness = max(0, proposedBarThickness)
        let bellRadius = max(barThickness / 2, proposedBellRadius)

        let vector = CGPoint(x: end.x - start.x, y: end.y - start.y)
        let length = hypot(vector.x, vector.y)

        if length == 0 {
            return CGPath(ellipseIn: CGRect(origin: start, size: .zero).insetBy(dx: -bellRadius, dy: -bellRadius), transform: nil)
        }

        var yOffset = barThickness / 2
        var xOffset = sqrt(bellRadius * bellRadius - yOffset * yOffset)
        let halfLength = length / 2
        if xOffset > halfLength {
            xOffset = halfLength
            yOffset = sqrt(bellRadius * bellRadius - xOffset * xOffset)
        }

        let jointRadians = asin(yOffset / bellRadius)
        let path = CGMutablePath()
        path.addArc(center: .zero, radius: bellRadius, startAngle: jointRadians, endAngle: -jointRadians, clockwise: false)
        path.addArc(center: CGPoint(x: length, y: 0), radius: bellRadius, startAngle: .pi + jointRadians, endAngle: .pi - jointRadians, clockwise: false)
        path.closeSubpath()

        let unitVector = CGPoint(x: vector.x / length, y: vector.y / length)
        var transform = CGAffineTransform(a: unitVector.x, b: unitVector.y, c: -unitVector.y, d: unitVector.x, tx: start.x, ty: start.y)
        return path.copy(using: &transform)!
    }
}

public enum PositionLabelPort {
    case top
    case left
    case bottom
}
