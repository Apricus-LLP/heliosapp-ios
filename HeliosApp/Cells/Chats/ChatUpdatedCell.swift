//
//  ChatUpdatedCell.swift
//  HeliosApp
//
//  Created by Pavel Mac on 15/10/24.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

class ChatUpdatedCell: UITableViewCell {
  
    @IBOutlet weak var msgCountView: UIView!
    @IBOutlet weak var muteNotificationImg: UIImageView!
    @IBOutlet weak var msgsCount: UILabel!
    @IBOutlet weak var msgTimeorDate: UILabel!
    @IBOutlet weak var lastMsg: UILabel!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        profileImg.layer.cornerRadius = profileImg.frame.size.width / 2
        profileImg.layer.masksToBounds = true
        msgCountView.layer.cornerRadius = msgCountView.frame.size.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
