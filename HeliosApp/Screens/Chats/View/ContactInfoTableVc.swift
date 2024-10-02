//
//  ContactInfoTableVc.swift
//  HeliosApp
//
//  Created by Pavel Mac on 15/09/24.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

class ContactInfoTableVc: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didEditBtnClick(_ sender: Any) {
        let editContactVc = AppStoryboard.chats.getRootViewController(EditContactVc.self)
        self.navigationController?.pushViewController(editContactVc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
