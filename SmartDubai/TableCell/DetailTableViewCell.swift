//
//  DetailTableViewCell.swift
//  SmartDubai
//
//  Created by Muhammad Umar on 10/07/2018.
//  Copyright © 2018 Muhammad Umar. All rights reserved.
//

import UIKit
import TrafficBase
import Kingfisher
class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configCell(_ data:MediaMetadatum) {
        
        self.imgView?.kf.setImage(with: URL(string: (data.url)))
        
    }
}
