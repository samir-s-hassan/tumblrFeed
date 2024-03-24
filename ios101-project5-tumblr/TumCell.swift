//
//  TumCell.swift
//  ios101-project5-tumblr
//
//  Created by Samir Hassan on 3/23/24.
//

import UIKit

class TumCell: UITableViewCell {

    @IBOutlet weak var tumblrPicView: UIImageView!
    
    @IBOutlet weak var numberLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
