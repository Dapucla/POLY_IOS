//
//  ResultsTVC.swift
//  HW_2
//
//  Created by Даниил Алексеев on 08.10.2021.
//

import UIKit

class ResultsTVC: UITableViewCell {

   
    @IBOutlet var resultImage: UIImageView!
    @IBOutlet var resultLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
