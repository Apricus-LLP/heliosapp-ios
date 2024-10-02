//
//  ChatViewModel.swift
//  HeliosApp
//
//  Created by Pavel Mac on 14/09/24.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

final class ChatViewModel {
    
    let chats: [ChatModel] = [
        .init(image: ._1, userName: "Damira", lastMsg: "What kind of strategy is better?", msgStatus: .readText, date: "23/9/24"),
        .init(image: ._2, userName: "Dias", lastMsg: "0:14", msgStatus: .voice, date: "23/9/24"),
        .init(image: ._3, userName: "Chief", lastMsg: "Bro, I have a good idea! ", msgStatus: .readText, date: "24/9/24"),
        .init(image: ._4, userName: "Paul Guest", lastMsg: "Photo", msgStatus: .photo, date: "24/9/24"),
        .init(image: ._5, userName: "Alina Client", lastMsg: "Actually I wanted to check with you about your online business plan on our…", msgStatus: .notReadText, date: "22/9/24"),
        .init(image: ._6, userName: "Nurzhas", lastMsg: "faster, look at", msgStatus: .readText, date: "22/9/24"),
        .init(image: ._7, userName: "Damira", lastMsg: "Ok, have a good trip!", msgStatus: .readText, date: "7/9/24"),
        
        .init(image: ._1, userName: "Damira", lastMsg: "What kind of strategy is better?", msgStatus: .readText, date: "23/9/24"),
        .init(image: ._2, userName: "Dias", lastMsg: "0:14", msgStatus: .voice, date: "23/9/24"),
        .init(image: ._3, userName: "Chief", lastMsg: "Bro, I have a good idea! ", msgStatus: .readText, date: "24/9/24"),
        .init(image: ._4, userName: "Paul Guest", lastMsg: "Photo", msgStatus: .photo, date: "24/9/24"),
        .init(image: ._5, userName: "Alina Client", lastMsg: "Actually I wanted to check with you about your online business plan on our…", msgStatus: .notReadText, date: "22/9/24"),
        .init(image: ._6, userName: "Nurzhas", lastMsg: "faster, look at", msgStatus: .readText, date: "22/9/24"),
        .init(image: ._7, userName: "Damira", lastMsg: "Ok, have a good trip!", msgStatus: .readText, date: "7/9/24"),
    ]
    
    func getMessages(sender1: Sender, sender2: Sender)->[Message] {
        var messagesChatData: [Message] = [
            
           .init(sender: sender1,
                 messageId: "3",
                 sentDate: Date().addingTimeInterval(-86400),
                 kind: .text("Hey Dear friend, how's it going?")),
             
           .init(sender: sender2,
                 messageId: "4",
                 sentDate: Date().addingTimeInterval(-76400),
                 kind: .text("Hey! I'm good, just finished up with work. What about you?")),
             
           .init(sender: sender1,
                 messageId: "5",
                 sentDate: Date().addingTimeInterval(-65400),
                 kind: .text("Same here, just got home. It's been a long day.")),
             
           .init(sender: sender2,
                 messageId: "6",
                 sentDate: Date().addingTimeInterval(-55400),
                 kind: .text("Tell me about it. Anything exciting happen?")),
             
           .init(sender: sender1,
                 messageId: "7",
                 sentDate: Date().addingTimeInterval(-45400),
                 kind: .text("Ok, just the usual office problem. How about you?")),
             
           .init(sender: sender2,
                 messageId: "8",
                 sentDate: Date().addingTimeInterval(-35400),
                 kind: .text("Nothing much. Just trying to survive the endless meetings.")),
             
           .init(sender: sender1,
                 messageId: "9",
                 sentDate: Date().addingTimeInterval(-25400),
                 kind: .text("Hi, I feel you. So, any plans for the weekend?")),
             
           .init(sender: sender2,
                 messageId: "10",
                 sentDate: Date().addingTimeInterval(-15400),
                 kind: .text("Not really, probably just chill at home. You?")),
             
           .init(sender: sender1,
                 messageId: "11",
                 sentDate: Date().addingTimeInterval(-5400),
                 kind: .text("Yeah, same here. Maybe catch a movie or something.")),
             
           .init(sender: sender2,
                 messageId: "12",
                 sentDate: Date().addingTimeInterval(-1400),
                 kind: .text("Sounds good. Let me know if you find anything interesting to watch.")),
             
           .init(sender: sender1,
                 messageId: "13",
                 sentDate: Date(),
                 kind: .text("Sure thing. Oh, by the way, did you hear about that new restaurant downtown?")),
             
           .init(sender: sender2,
                 messageId: "14",
                 sentDate: Date().addingTimeInterval(1000),
                 kind: .text("Yeah, I did! I heard they have amazing biryani. We should check it out sometime.")),
             
           .init(sender: sender1,
                 messageId: "15",
                 sentDate: Date().addingTimeInterval(2000),
                 kind: .text("Amazing! How about next weekend?")),
             
           .init(sender: sender2,
                 messageId: "16",
                 sentDate: Date().addingTimeInterval(3000),
                 kind: .text("Sounds like a good roadmap. Can't wait to try it out.")),
             
           .init(sender: sender1,
                 messageId: "17",
                 sentDate: Date().addingTimeInterval(4000),
                 kind: .text("Great! It's a date then.")),
             
           .init(sender: sender2,
                 messageId: "18",
                 sentDate: Date().addingTimeInterval(5000),
                 kind: .text("Haha, you wish! Alright, catch you later, CEO.")),
             
           .init(sender: sender1,
                 messageId: "19",
                 sentDate: Date().addingTimeInterval(6000),
                 kind: .text("Take care. See you soon!"))
       ]
        
        return messagesChatData
    }
}

