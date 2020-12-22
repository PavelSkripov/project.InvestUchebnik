//
//  TableViewCell.swift
//  ИнвестУчебник
//
//  Created by Павел on 19.12.2020.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    
    @IBOutlet weak var titleCell: UILabel!
    
    @IBOutlet weak var subTitleCell: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setTitle (title: String, subTitle: String) {
        titleCell.text = title
        subTitleCell.text = subTitle
    }
    
    public func setFeed (feed: Feed) {
        titleCell.text = feed.title
        subTitleCell.text = feed.subtitle
        imageCell.downloadedFrom (link: feed.cover)
    }
}
