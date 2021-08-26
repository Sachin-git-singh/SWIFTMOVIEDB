//
//  CustomCellTableViewCell.swift
//  MovieDB
//
//  Created by sachin singh on 25/08/21.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {

    @IBOutlet var image1: UIImageView!
    
    @IBOutlet var label1: UILabel!
    
    
    @IBOutlet var label2: UILabel!
    
    @IBOutlet var label3: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
