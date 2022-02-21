//
//  ChatViewModel.swift
//  BotAssistance
//
//  Created by Activ Health on 21/02/22.
//

import Foundation
import UIKit
protocol SendMessageProtocol:NSObject {
    func messageSend()
}

class ChatViewModel{
    // MARK: - Global Variable Declaration
    weak var delegateSendMessage:SendMessageProtocol?
    // MARK: - Initialization
    init(delegate:SendMessageProtocol) {
        delegateSendMessage = delegate
    }
    // MARK: - Self Defined Function
    func sendMessage(strMessage:String,isBotMessage:Bool,index:Int){
        var newMesage:Messages?
        if isBotMessage{
            newMesage = Messages(strSender: "Bot", strMessage: "Hi Hi...", strdateMessage:"\(Date())")
        }else{
            newMesage = Messages(strSender: "User", strMessage: strMessage, strdateMessage:"\(Date())")
        }
        SendChatMessage.sendMessages(index: index, dataMessage: newMesage!) { Success in
            delegateSendMessage?.messageSend()
        }
    }
}

