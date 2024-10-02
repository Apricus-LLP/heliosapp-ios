//
//  CallsViewModel.swift
//  HeliosApp
//
//  Created by Pavel Mac on 14/09/24.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

final class CallsViewModel{
    let allCalls: [CallsModel] = [
        .init(userName: "Sergey Writer", userImg: ._1, callType: .outgoing, date: "24/9/24"),
        .init(userName: "Dias", userImg: ._2, callType: .outgoing, date: "24/9/24"),
        .init(userName: "Damira", userImg: ._3, callType: .incoming, date: "9/9/24"),
        .init(userName: "Dias", userImg: ._4, callType: .missed, date: "9/9/24"),
        .init(userName: "Chief", userImg: ._5, callType: .outgoing, date: "22/9/24"),
        .init(userName: "Damira", userImg: ._6, callType: .missed, date: "22/9/24"),
        .init(userName: "Paul Guest", userImg: ._7, callType: .incoming, date: "22/9/24"),
        .init(userName: "Sergey Writer", userImg: ._1, callType: .outgoing, date: "7/9/24"),
        .init(userName: "Dias", userImg: ._2, callType: .outgoing, date: "7/9/24"),
        .init(userName: "Damira", userImg: ._3, callType: .incoming, date: "6/9/24"),
        .init(userName: "Dias", userImg: ._4, callType: .missed, date: "2/9/24"),
        
        .init(userName: "Sergey Writer", userImg: ._1, callType: .outgoing, date: "24/9/24"),
        .init(userName: "Dias", userImg: ._2, callType: .outgoing, date: "24/9/24"),
        .init(userName: "Damira", userImg: ._3, callType: .incoming, date: "9/9/24"),
        .init(userName: "Dias", userImg: ._4, callType: .outgoing, date: "9/9/24"),
        .init(userName: "Chief", userImg: ._5, callType: .missed, date: "22/9/24"),
        .init(userName: "Damira ", userImg: ._6, callType: .incoming, date: "22/9/24"),
        .init(userName: "Paul Guest", userImg: ._7, callType: .incoming, date: "22/9/24"),
        .init(userName: "Sergey Writer", userImg: ._1, callType: .outgoing, date: "7/9/24"),
        .init(userName: "Dias", userImg: ._2, callType: .missed, date: "7/9/24"),
        .init(userName: "Damira", userImg: ._3, callType: .incoming, date: "6/9/24"),
        .init(userName: "Dias", userImg: ._4, callType: .outgoing, date: "2/9/24"),
    ]
}
