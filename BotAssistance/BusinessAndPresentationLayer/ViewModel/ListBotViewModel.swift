//
//  ListBotViewModel.swift
//  BotAssistance
//
//  Created by Activ Health on 20/02/22.
//

import Foundation

class ListBotViewModel {
    init(){
       getBotList()
    }
    private func getBotList(){
        ChatBotJson.sharedInstance.getBotDataFromLocalJson(objectType: ChatModel.self) { response in
            guard let sort = (response.chatData?.sorted(by: {$0.date ?? "" < $1.date ?? ""})) else {
                    return
            }
            ChatBotJson.sharedInstance.arrayBot = sort
        }
    }
}
