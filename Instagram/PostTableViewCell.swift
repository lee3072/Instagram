//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by 이승헌 on 13/02/2019.
//  Copyright © 2019 individual. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var image_view: UIImageView!
    @IBOutlet weak var comment_label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
