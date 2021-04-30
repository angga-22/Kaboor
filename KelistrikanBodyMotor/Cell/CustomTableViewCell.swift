//
//  CustomTableViewCell.swift
//  customTableView
//
//  Created by angga saputra on 26/04/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var image_cell: UIImageView!
    
    @IBOutlet weak var title_cell: UILabel!
    
    

    
    var zoomBackground: ZoomBackground!
    
    func updateUI(){
        title_cell.text = zoomBackground.title.rawValue
        title_cell.layer.shadowColor = UIColor.black.cgColor
        title_cell.layer.shadowColor = UIColor.black.cgColor
        title_cell.layer.shadowRadius = 3.0
        title_cell.layer.shadowOpacity = 2.0
        title_cell.layer.shadowOffset = CGSize(width: 2, height: 2)
        title_cell.layer.masksToBounds = false
        image_cell.image = UIImage(named: zoomBackground.image)
        image_cell?.layer.cornerRadius = 5
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


struct ZoomBackground{
    var title: Judul!
    var detail: String!
    var image: String!
}
