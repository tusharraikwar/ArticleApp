//
//  ArticleDescriptionTableCell.swift
//  ArticalDetailApp
//
 
//

import UIKit

class ArticleDescriptionTableCell: UITableViewCell {
    @IBOutlet var txtViewDescription: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textViewConfiguration()
    }
    private func textViewConfiguration(){
        txtViewDescription.isEditable = false
        txtViewDescription.isSelectable = false
        txtViewDescription.isScrollEnabled = false
        txtViewDescription.bounces = false
        txtViewDescription.bouncesZoom = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
