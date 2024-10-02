//
//  ChatsVc.swift
//  HeliosApp
//
//  Created by Pavel Mac on 14/09/24.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

class ChatsVc: UIViewController {

    @IBOutlet weak var chatTableView: UITableView! {
        didSet {
            chatTableView.register(ChatCell.nib, forCellReuseIdentifier: ChatCell.id)
        }
    }
    
    let viewModel = ChatViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}


extension ChatsVc: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatCell.id, for: indexPath) as? ChatCell else {
            fatalError()
        }
        cell.chat = viewModel.chats[indexPath.row]
        return cell
    }
}


extension ChatsVc: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let more = UIContextualAction(style: .normal, title: "More") { action, view, boolValue in
            self.showActionSheet()
        }
       
        let archive = UIContextualAction(style: .normal, title: "Archive") { action, view, boolValue in
            
        }
        archive.backgroundColor = .systemIndigo
        
        return UISwipeActionsConfiguration(actions: [archive, more])
    }
    
    private func showActionSheet() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let muteBtn = UIAlertAction(title: "Mute", style: .default) { alertAction in
            
        }
        let contactInfoBtn = UIAlertAction(title: "Contact Info", style: .default) { alertAction in
            
        }
        let exportChatBtn = UIAlertAction(title: "Export Chat", style: .default) { alertAction in
            
        }
        let clearChatBtn = UIAlertAction(title: "Clear Chat", style: .default) { alertAction in
            
        }
        let deleteChatBtn = UIAlertAction(title: "Delete Chat", style: .destructive) { alertAction in
            
        }
        let cancelBtn = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(muteBtn)
        alert.addAction(contactInfoBtn)
        alert.addAction(exportChatBtn)
        alert.addAction(clearChatBtn)
        alert.addAction(deleteChatBtn)
        alert.addAction(cancelBtn)
        present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatDetailVc = AppStoryboard.chats.getRootViewController(ChatDetailVc.self)
        chatDetailVc.hidesBottomBarWhenPushed = true
        chatDetailVc.chatData = viewModel.chats[indexPath.row]
        self.navigationController?.pushViewController(chatDetailVc, animated: true)
    }
}
