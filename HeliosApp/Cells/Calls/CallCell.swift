//
//  CallCell.swift
//  HeliosApp
//
//  Created by Pavel Mac on 11/10/24.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

class CallCell: UITableViewCell {
    
    @IBOutlet weak var callerImg: UIImageView!
    @IBOutlet weak var callerName: UILabel!
    @IBOutlet weak var callingStatusImg: UIImageView!
    @IBOutlet weak var callingStatusName: UILabel!
    @IBOutlet weak var callDateOrTime: UILabel!
    @IBOutlet weak var callInfoBtn: UIButton!

      override func awakeFromNib() {
          super.awakeFromNib()
          
          callInfoBtn.setTitle("", for: .normal)
          callerImg.layer.cornerRadius = callerImg.frame.width / 2
      }

      override func setSelected(_ selected: Bool, animated: Bool) {
          super.setSelected(selected, animated: animated)
      }
}
