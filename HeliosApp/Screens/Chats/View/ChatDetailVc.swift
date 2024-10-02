//
//  ChatDetailVc.swift
//  HeliosApp
//
//  Created by Pavel Mac on 14/09/24.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit
import MessageKit

struct Sender: SenderType {
    var senderId: String
    var displayName: String
}

struct Message: MessageType {
    var sender: any MessageKit.SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKit.MessageKind
}

struct ImageSend: MediaItem {
    var url: URL?
    var image: UIImage?
    var placeholderImage: UIImage
    var size: CGSize
}


class ChatDetailVc: MessagesViewController {
    var chatData: ChatModel?
    let viewModel = ChatViewModel()
    
    let gModelUser = Sender(senderId: "guest", displayName: "Guest")
    let pModelUser = Sender(senderId: "paul", displayName: "Paul")
    var messagesModel: [Message] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        addNavigationTitleHeaderView()
        messageKitConfiguration()
    }
    
    private func messageKitConfiguration() {
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
        self.messagesModel = viewModel.getMessages(sender1: gModelUser, sender2: pModelUser)
    }
    
    private func addNavigationTitleHeaderView() {
        let chatDetailHeader = ChatDetailHeader(frame: .init(x: 0, y: 0, width:  200, height: 100))
        chatDetailHeader.chatData = self.chatData
        chatDetailHeader.refrenceVc = self
        navigationItem.titleView = chatDetailHeader
    }
}


extension ChatDetailVc: MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    func currentSender() -> any MessageKit.SenderType {
        return pModelUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessageKit.MessagesCollectionView) -> any MessageKit.MessageType {
        return messagesModel[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessageKit.MessagesCollectionView) -> Int {
        return messagesModel.count
    }
    
    func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
            return isFromCurrentSender(message: message) ? UIColor.systemOrange : UIColor.systemGray5
    }
}

