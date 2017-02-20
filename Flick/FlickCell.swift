//
//  FlickCell.swift
//  Flick
//
//  Created by Ekko Lin on 2/19/17.
//  Copyright © 2017 CodePath. All rights reserved.
//

import UIKit

class FlickCell: UITableViewCell {

    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        posterView.layer.cornerRadius = 20
        posterView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
