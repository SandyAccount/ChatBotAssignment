//
//  InitiateBot.swift
//  BotAssistance
//
//  Created by Activ Health on 21/02/22.
//

import Foundation

class InitiateBot {
    // MARK: - Bot Created Function
    static func initiateBot(strBotName:String,strBotCreatedDate:String,createdDate:Date,strJson:String? = "Bot.json",Completion:((_ jsonData : Bool) -> Void)){
        var dataBotArray:Data?
        let botObject = ChatData(strBotName: strBotName, strDate: strBotCreatedDate, createdDate: createdDate)
        if ChatBotJson.sharedInstance.arrayBot?.count ?? 0 < 1{
            ChatBotJson.sharedInstance.arrayBot = []
        }
        ChatBotJson.sharedInstance.arrayBot?.append(botObject)
        let newBotObject = ["data":ChatBotJson.sharedInstance.arrayBot]
        do{
            if let encoded = try? JSONEncoder().encode(newBotObject) {
                dataBotArray = encoded//try JSONSerialization.data(withJSONObject:encoded)
            }
            guard let documentDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
            let fileUrl = documentDirectoryUrl.appendingPathComponent(strJson ?? "Bot.json")
            if let _ = dataBotArray{
                try dataBotArray!.write(to: fileUrl)
                Completion(true)
            }else{
                Completion(false)
            }
            
        }catch{
            Completion(false)
        }
    }
}

