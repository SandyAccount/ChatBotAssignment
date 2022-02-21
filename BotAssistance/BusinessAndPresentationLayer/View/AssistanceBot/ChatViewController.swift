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
    @IBOutlet weak var viewSendMessage: UIView!
    var iIndex:Int?
    var chatViewModel:ChatViewModel?
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
        self.viewSendMessage.setAttributToView(cornerRadius: 5.0, borderWidth: 1.0, borderColor: UIColor.lightGray)
        chatViewModel = ChatViewModel(delegate: self)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name:UIResponder.keyboardWillShowNotification, object: nil)
    }
   @objc func keyboardWillShow(notification: Notification) {
        self.viewSendMessage.frame.origin.y = -150
        print(self.viewSendMessage.frame)
   }
    @objc func keyboardWillHide(notification: Notification) {
        self.viewSendMessage.frame.origin.y = 0
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
            //self.replyFromBot()
            self.sendMessage(isBotMessage: true)
            self.buttonSendOutlet.isEnabled = true
        }
    }
    // MARK: - Send Message
    func sendMessage(isBotMessage:Bool){
        chatViewModel?.sendMessage(strMessage: self.textFieldMessage.text ?? "", isBotMessage: isBotMessage, index: iIndex!)
    }
}





