//
//  ChatModel.swift
//  HeliosApp
//
//  Created by Pavel Mac on 24/09/24.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

struct ChatModel {
    var image: UIImage
    var userName: String
    var lastMsg: String
    var msgStatus: MassageStatus
    var date: String
}

enum MassageStatus {
    case voice
    case photo
    case readText
    case notReadText
}
