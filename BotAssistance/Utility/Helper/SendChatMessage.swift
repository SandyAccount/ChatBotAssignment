//
//  SendChatMessage.swift
//  BotAssistance
//
//  Created by Activ Health on 21/02/22.
//

import Foundation
class SendChatMessage {
    static func sendMessages(index:Int,dataMessage:Messages,strJson:String? = "Bot.json",Completion:((_ jsonData : Bool) -> Void)){
        var dataBotArray:Data?
        if let _ = ChatBotJson.sharedInstance.arrayBot{
            ChatBotJson.sharedInstance.arrayBot?[index].messages.append(dataMessage)
            
        }
        let newBotObject = ["data":ChatBotJson.sharedInstance.arrayBot]
        do{
        if let encoded = try? JSONEncoder().encode(newBotObject) {
            print(encoded)
            dataBotArray = encoded//try JSONSerialization.data(withJSONObject:encoded)
        }
      }
        guard let documentDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let fileUrl = documentDirectoryUrl.appendingPathComponent(strJson ?? "Bot.json")
        try? dataBotArray!.write(to: fileUrl)
        Completion(true)
    }
}
