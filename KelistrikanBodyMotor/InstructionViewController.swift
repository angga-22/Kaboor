//
//  InstructionViewController.swift
//  KelistrikanBodyMotor
//
//  Created by Muhammad Firdaus on 30/04/21.
//

import UIKit

class InstructionViewController: UIViewController {

    @IBOutlet weak var titleInstructionLabel: UILabel!
    @IBOutlet weak var contentInstructionLabel: UILabel!
    
    var type : Judul? = Judul.lampuNetral
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var title = ""
        var content = ""
        switch type {
        case .lampuNetral: do {
            
                content = """
                1. Hubungkan Positif (+) aki ke salah satu terminal fuse.
                2. Hubungkan terminal G pada fuse ke terminal B dari kunci kontak
                3. Hubungkan terminal IG pada kunci kontak ke terminal IG lampu netral
                4. hubungkan terminal lampu netral yang lain ke terminal perseneling
                5. dan sambungkan terminal perseneling yang lain ke negatif (-) aki
                """
            }
                    
        case .klakson: do {
                
                content = """
                1. Hubungkan positif (+) aki ke salah satu terminal fuse.
                2. Hubungkan terminal G pada fuse ke terminal B dari kunci kontak
                3. Hubungkan terminal IG pada kunci kontak ke terminal B klakson
                4. Hubungkan terminal HR pada klakson ke terminal HR pada switch klakson
                5. Hubungkan terminal E pada switch klakson ke negatif (-) aki
                """
            }
                    
        case .lampuRem:do {
                
                content = """
                1. Hubungkan positif (+) aki ke salah satu terminal fuse.
                2. Hubungkan terminal G pada fuse ke terminal B dari kunci kontak
                3. Hubungkan terminal IG pada kunci kontak ke terminal B klakson
                4. Hubungkan terminal HR pada klakson ke terminal HR pada switch klakson
                5. Hubungkan terminal E pada switch klakson ke negatif (-) aki
                """
            }
                    
        case .lampuSein:do {
                
                content = """
                1. Hubungkan positif (+) aki ke salah satu terminal fuse.
                2. Hubungkan terminal G pada fuse ke terminal B dari kunci kontak
                3. Hubungkan terminal IG pada kunci kontak ke terminal B klakson
                4. Hubungkan terminal HR pada klakson ke terminal HR pada switch klakson
                5. Hubungkan terminal E pada switch klakson ke negatif (-) aki
                """
            }
                    
        case .lampuKepala:do {
                
                content = """
                1. Hubungkan positif (+) aki ke salah satu terminal fuse.
                2. Hubungkan terminal G pada fuse ke terminal B dari kunci kontak
                3. Hubungkan terminal IG pada kunci kontak ke terminal B klakson
                4. Hubungkan terminal HR pada klakson ke terminal HR pada switch klakson
                5. Hubungkan terminal E pada switch klakson ke negatif (-) aki
                """
            }
        case .none: break
        }
        title = "Langkah - langkah wiring \(type?.rawValue ?? "")"
        self.titleInstructionLabel.text = title
        self.contentInstructionLabel.text = content
    }
}
