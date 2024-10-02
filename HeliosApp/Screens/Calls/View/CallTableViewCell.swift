//
//  CallTableViewCell.swift
//  HeliosApp
//
//  Created by Pavel Mac on 26/09/24.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

class CallTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblCallType: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    var callData: CallsModel? {
        didSet {
            userImg.image = callData?.userImg
            lblUserName.text = callData?.userName
            lblUserName.textColor = (callData?.callType == .missed) ? .systemRed : .label
            lblCallType.text = callData?.callType.rawValue
            lblDate.text = callData?.date
        }
    }
}
