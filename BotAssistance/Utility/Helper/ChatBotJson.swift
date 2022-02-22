//
//  ChatBotJson.swift
//  BotAssistance
//
//  Created by Sandesh on 21/02/22.
//

import Foundation

class ChatBotJson {
    // MARK: - Global Variable Declaration
    static let sharedInstance = ChatBotJson()
    var arrayBot:[ChatData]?
    // MARK: - Initialization
    private init(){}
    // MARK: - Self Defined Function
    func getBotDataFromLocalJson<T:Codable>(objectType:T.Type,strJson:String? = "Bot.json",Completion:((_ jsonData : T) -> Void),failure:((_ status : Bool) -> Void)) {
        guard let documentsDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let fileUrl = documentsDirectoryUrl.appendingPathComponent("Bot.json")
        // Read data from .json file and transform data into an array
        do {
            let data = try Data(contentsOf: fileUrl, options: [])
            guard let chatBotArray = try? JSONDecoder().decode(T.self, from: data) else {
                return
            }
            Completion(chatBotArray)
        } catch {
            failure(true)
        }
    }
}
