//
//  SettingCell.swift
//  HeliosApp
//
//  Created by Pavel Mac on 11/10/24.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

class SettingCell: UITableViewCell {
    
    @IBOutlet weak var settingName: UILabel!
    @IBOutlet weak var settingImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
