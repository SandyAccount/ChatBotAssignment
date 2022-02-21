//
//  ChatViewModel.swift
//  BotAssistance
//
//  Created by Activ Health on 21/02/22.
//

import Foundation

protocol SendMessageProtocol {
    func messageSend()
}

class ChatViewModel{
    var delegateSendMessage:SendMessageProtocol?
    init(delegate:SendMessageProtocol) {
        delegateSendMessage = delegate
    }
    
    func sendMessage(strMessage:String,isBotMessage:Bool,index:Int){
        var newMesage:Messages?
        if isBotMessage{
            newMesage = Messages(strSender: "Bot", strMessage: "Hi Hi...", strdateMessage:"\(Date())")
        }else{
            newMesage = Messages(strSender: "User", strMessage: strMessage, strdateMessage:"\(Date())")
        }
        SendChatMessage.sendMessages(index: index, dataMessage: newMesage!) { Success in
//            tableviewChat.reloadData()
//            self.textFieldMessage.text = ""
//            buttonSendOutlet.isEnabled = false
            delegateSendMessage?.messageSend()
            
        }
    }
}
