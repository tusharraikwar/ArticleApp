//
//  ArticleLikesAndCommentsCountTableCell.swift
//  ArticalDetailApp
//
 
//

import UIKit

class ArticleLikesAndCommentsCountTableCell: UITableViewCell {
    @IBOutlet var lblLikes: UILabel!
    @IBOutlet var lblComments: UILabel!
    @IBOutlet var lblBottomBar: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
