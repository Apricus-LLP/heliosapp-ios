//
//  ChatDetailHeader.swift
//  HeliosApp
//
//  Created by Pavel Mac on 16/09/24.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

class ChatDetailHeader: UIView {
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    var refrenceVc: UIViewController?
    
    var chatData: ChatModel? {
        didSet {
            profileImg.image = chatData?.image
            lblName.text = chatData?.userName
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commitInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commitInit()
    }
    
    private func commitInit() {
        Bundle.main.loadNibNamed(ChatDetailHeader.id, owner: self,options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [ .flexibleHeight, .flexibleWidth ]
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(containerViewTapped))
        containerView.addGestureRecognizer(tap)
    }
    
    @objc func containerViewTapped() {
        let contactInfo = AppStoryboard.chats.getRootViewController(ContactInfoTableVc.self)
        refrenceVc?.navigationController?.pushViewController(contactInfo, animated: true)
    }
}
