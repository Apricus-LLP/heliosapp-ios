//
//  ChannelCell.swift
//  HeliosApp
//
//  Created by Pavel Mac on 11/10/24.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {
    
    @IBOutlet weak var followingBtn: UIButton!
    @IBOutlet weak var followBtn: UIButton!
    @IBOutlet weak var followersCount: UILabel!
    @IBOutlet weak var channelName: UILabel!
    @IBOutlet weak var channelImg: UIImageView!
    
    override func awakeFromNib() {
      
        super.awakeFromNib()
            
        configureBtn(isSelected: false)
        followingBtn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        channelImg.layer.cornerRadius = channelImg.frame.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
       super.setSelected(selected, animated: animated)
    }
      
    @IBAction func followBtn(_ sender: Any) {
        configureBtn(isSelected: true)
    }
    
    @IBAction func followingBtn(_ sender: Any) {
        configureBtn(isSelected: false)
    }
    
    private func configureBtn(isSelected: Bool) {
        followingBtn.isHidden = !isSelected
        followBtn.isHidden = isSelected
        followingBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        followingBtn.layoutIfNeeded()
        self.layoutIfNeeded()
    }
}
