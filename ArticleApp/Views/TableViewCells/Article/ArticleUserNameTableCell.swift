//
//  ArticleUserNameTableCell.swift
//  ArticalDetailApp
//
 
//

import UIKit

class ArticleUserNameTableCell: UITableViewCell {
    @IBOutlet var imgUser: UIImageView!
    @IBOutlet var lblUserName: UILabel!
    @IBOutlet var lblUserDesignation: UILabel!
    @IBOutlet var lblTimes: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgUser.layer.cornerRadius = imgUser.frame.height/2
        imgUser.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
