//
//  ChatViewController.swift
//  BotAssistance
//
//  Created by Activ Health on 18/02/22.
//

import UIKit

class ChatViewController: UIViewController {
    // MARK: - Iboutlet and Global Variable Declaration
    @IBOutlet weak var buttonSendOutlet: UIButton!
    @IBOutlet weak var textFieldMessage: UITextField!
    @IBOutlet weak var tableviewChat: UITableView!
    var iIndex:Int?
    // MARK: - Load view with nib initialization
    static func loadChatView(strBotName:String,index:Int) -> ChatViewController{
        let chatView = ChatViewController(nibName: "ChatViewController", bundle: nil)
        chatView.title = strBotName
        chatView.iIndex = index
        return chatView
    }
    // MARK: - View Life Cycle
    override func viewDidLoad(){
        super.viewDidLoad()
       setNavigationBar()
       registerCell()
    }
    private func setNavigationBar(){
        navigationController?.setNavigationTheme(isBackBarButton: true, isRightBarButton: false, navigationTitle: "Chat Assistant")
    }
    private func registerCell(){
        self.tableviewChat.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: "Chat")
    }
    // MARK: - Ibaction Click event
   // Send Message from User
    @IBAction func buttonSendMessageClicked(_ sender: Any) {
        sendMessage(isBotMessage: false)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.replyFromBot()
            self.buttonSendOutlet.isEnabled = true
        }
    }
    // MARK: - Send Message
    func sendMessage(isBotMessage:Bool){
        var newMesage:Messages?
        if isBotMessage{
            newMesage = Messages(strSender: "Bot", strMessage: "Hi Hi...", strdateMessage:"\(Date())")
        }else{
            newMesage = Messages(strSender: "User", strMessage: textFieldMessage.text ?? "", strdateMessage:"\(Date())")
        }
        SendChatMessage.sendMessages(index: iIndex!, dataMessage: newMesage!) { Success in
            tableviewChat.reloadData()
            self.textFieldMessage.text = ""
            buttonSendOutlet.isEnabled = false
            
        }
    }
    // MARK: - Send Message from bot
    func replyFromBot() {
        sendMessage(isBotMessage: true)
    }
}



