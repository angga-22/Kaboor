//
//  ToolDetailViewController.swift
//  KelistrikanBodyMotor
//
//  Created by Kelny Tan on 28/04/21.
//

import UIKit

class ToolDetailViewController: UIViewController {
    var toolName: String?
    var toolTerpilih: ToolModel!
    
    @IBOutlet weak var toolImageView: UIImageView!
    @IBOutlet weak var toolJudulLabel: UILabel!
    @IBOutlet weak var toolDescriptionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        toolTerpilih = getToolByNama(nama: toolName!)
        /*navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Back", style: .plain, target: nil, action: nil)*/
        toolImageView.image = UIImage(named: toolTerpilih.toolImage!)
        toolJudulLabel.text = "Tentang \(toolTerpilih.toolName!)"
        toolDescriptionLabel.text = toolTerpilih.toolDescription
        navigationItem.title = toolTerpilih.toolName
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
