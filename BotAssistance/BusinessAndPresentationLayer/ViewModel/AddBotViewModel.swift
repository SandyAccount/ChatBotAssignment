//
//  AddBotViewModel.swift
//  BotAssistance
//
//  Created by Sandesh on 22/02/22.
//

import Foundation
class AddBotViewModel {
    init() {}
    func updateBotData(botName:String,Completion:((_ jsonData : Bool) -> Void)) {
        InitiateBot.initiateBot(strBotName: botName, strBotCreatedDate: "\(Date())",createdDate:Date()) { success in
            guard let arrayChat = ChatBotJson.sharedInstance.arrayBot?.sorted(by:{$0.sortDate ?? Date() > $1.sortDate ?? Date()}) else{
                Completion(false)
                return
            }
            let arrayfilterChatCount = (arrayChat.filter {($0.messages.count > 0)} + arrayChat.filter {($0.messages.count < 1)})
            ChatBotJson.sharedInstance.arrayBot = arrayfilterChatCount
            Completion(true)
        }
    }
    func validateUniqueBotName(strBotName:String) -> Bool{
        if let arrayChat = ChatBotJson.sharedInstance.arrayBot{
            let uniqueBotName = arrayChat.filter { $0.botName == strBotName}
            if  uniqueBotName.count > 0 {
                return false
            }
            return true
        }
        return true
    }
}
