//
//  ChatModel.swift
//  BotAssistance
//
//  Created by Activ Health on 19/02/22.
//

import Foundation

struct ChatModel:Codable {
    var chatData:[ChatData]?
    enum CodingKeys: String, CodingKey {
        case chatData = "data"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        chatData = try values.decodeIfPresent([ChatData].self, forKey: .chatData)
    }
}
struct ChatData:Codable {
    let botName : String?
    var date : String?
    var lastMessage : String?
    var messages:[Messages] = []
    enum CodingKeys: String, CodingKey {
        case botName = "botName"
        case date = "date"
        case lastMessage = "lastMessage"
        case messages = "messages"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        botName = try values.decodeIfPresent(String.self, forKey: .botName)
        date = try values.decodeIfPresent(String.self, forKey: .date)
        lastMessage = try values.decodeIfPresent(String.self, forKey: .lastMessage)
        messages = try values.decodeIfPresent([Messages].self, forKey: .messages) ?? []
    }
    init(strBotName:String,strDate:String) {
        botName = strBotName
        date = strDate
    }
}

struct Messages:Codable {
    var sender : String = ""
    var message : String = ""
    var dateMessage : String = ""
    enum CodingKeys: String, CodingKey {
        case sender = "sender"
        case message = "message"
        case dateMessage = "dateMessage"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sender = try values.decodeIfPresent(String.self, forKey: .sender) ?? ""
        message = try values.decodeIfPresent(String.self, forKey: .message) ?? ""
        dateMessage = try values.decodeIfPresent(String.self, forKey: .dateMessage) ?? ""
    }
    init(strSender:String,strMessage:String,strdateMessage:String) {
        sender = strSender
        message = strMessage
        dateMessage = strdateMessage
    }
}
