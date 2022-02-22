//
//  ChatModel.swift
//  BotAssistance
//
//  Created by Sandesh on 21/02/22.
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
    var sortDate : Date?
    enum CodingKeys: String, CodingKey {
        case botName = "botName"
        case date = "date"
        case lastMessage = "lastMessage"
        case messages = "messages"
        case sortDate = "sortDate"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        botName = try values.decodeIfPresent(String.self, forKey: .botName)
        date = try values.decodeIfPresent(String.self, forKey: .date)
        lastMessage = try values.decodeIfPresent(String.self, forKey: .lastMessage)
        messages = try values.decodeIfPresent([Messages].self, forKey: .messages) ?? []
        sortDate = try values.decodeIfPresent(Date.self, forKey: .sortDate)
    }
    init(strBotName:String,strDate:String,createdDate:Date) {
        botName = strBotName
        date = strDate
        sortDate = createdDate
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
