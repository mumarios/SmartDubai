//
//  NewsTableViewCell.swift
//  SmartDubai
//
//  Created by Muhammad Umar on 09/07/2018.
//  Copyright © 2018 Muhammad Umar. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDate: UILabel?
    @IBOutlet weak var lblAuthor: UILabel?
    @IBOutlet weak var lblHeading: UILabel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configCell(_ data:Result) {
        
        self.lblHeading?.text = data.title
        self.lblAuthor?.text = data.byline
        self.lblDate?.text = data.publishedDate
     
    }
}
