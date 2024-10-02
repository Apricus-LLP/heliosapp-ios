//
//  SettingTableVc.swift
//  HeliosApp
//
//  Created by Pavel Mac on 22/09/24.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

class SettingTableVc: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func showAlertSheet() {
        let alertSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let mail = UIAlertAction(title: "Mail", style: .default)
        let message = UIAlertAction(title: "Message", style: .default)
        let more = UIAlertAction(title: "More", style: .default)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alertSheet.addAction(mail)
        alertSheet.addAction(message)
        alertSheet.addAction(more)
        alertSheet.addAction(cancel)
        present(alertSheet, animated: true)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectedVc: UIViewController?
        switch indexPath.section {
        case 0: selectedVc = AppStoryboard.settings.getRootViewController(EditProfileTableVc.self)
            
        case 1:
            switch indexPath.row {
            case 0: selectedVc = AppStoryboard.settings.getRootViewController(StarredMessagesVc.self)
            case 1: break
            default: break
            }
            
        case 2:
            switch indexPath.row {
            case 0: selectedVc = AppStoryboard.settings.getRootViewController(AccountTableVc.self)
            case 1: selectedVc = AppStoryboard.settings.getRootViewController(ChatsTableVc.self)
            case 2: selectedVc = AppStoryboard.settings.getRootViewController(NotificationTableVc.self)
            case 3: selectedVc = AppStoryboard.settings.getRootViewController(DataStoragUsageTableVc.self)
            default: break
            }
            
        case 3:
            switch indexPath.row {
            case 0:
                if let url = URL(string: "https://apricus.kz/") {
                    UIApplication.shared.open(url)
                }
            case 1: showAlertSheet()
            default: break
            }
            
        default: break
        }
        
        if let selectedVc {
            selectedVc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(selectedVc, animated: true)
        }
    }
}
