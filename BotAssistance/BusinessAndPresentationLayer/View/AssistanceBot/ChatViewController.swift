//
//  ChatViewController.swift
//  BotAssistance
//
//  Created by Activ Health on 21/02/22.
//

import UIKit

class ChatViewController: UIViewController{
    // MARK: - Iboutlet and Global Variable Declaration
    @IBOutlet weak var buttonSendOutlet: UIButton!
   // @IBOutlet weak var textFieldMessage: UITextField!
    @IBOutlet weak var textViewMessage: UITextView!
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
        textViewMessage.delegate = self
        setUpInterface()
        setNavigationBar()
        registerCell()
        self.registerObserver()
        chatViewModel = ChatViewModel(delegate: self)
    }
    private func setUpInterface(){
        self.viewSendMessage.setAttributToView(cornerRadius: 5.0, borderWidth: 1.0, borderColor: UIColor.lightGray)
        textViewMessage.setAttributToView(cornerRadius: 5.0, borderWidth: 1.0, borderColor: UIColor.lightGray)
    }
  // MARK: - Register Observer
   private func registerObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(ChatViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(ChatViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    // MARK: - Observer Method
    @objc private func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    @objc private func keyboardWillHide(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    // MARK: - SetNavigation
    private func setNavigationBar(){
        navigationController?.setNavigationTheme(isBackBarButton: true, isRightBarButton: false, navigationTitle: "")
        
        
    }
    // MARK: - Register Tableview and Collectionview cell
    private func registerCell(){
        self.tableviewChat.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: "Chat")
    }
    // MARK: - Ibaction Click event
   // Send Message from User
    @IBAction private func buttonSendMessageClicked(_ sender: Any) {
        textViewMessage.resignFirstResponder()
        sendMessage(isBotMessage: false)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.sendMessage(isBotMessage: true)
            self.buttonSendOutlet.isEnabled = true
        }
    }
    // MARK: - Send Message
    private func sendMessage(isBotMessage:Bool){
        if !(textViewMessage.text?.validateEmpty() ?? false) && !isBotMessage{
            commonMethod.controller = self
            commonMethod.showAlert(strTitle: "Error!", strMessage: "Please enter message")
            return
        }
        chatViewModel?.sendMessage(strMessage: self.textViewMessage.text ?? "", isBotMessage: isBotMessage, index: iIndex!)
    }
}
//////////////////////////////////////////////////////////////////////////////////////////////////

/*
Note -:
View -: Chatviewcontroller
ViewModel -: ChatViewModel
Model -: Chatmodel
Extention -: ExtentionChatViewController

Helper Class -:
 SendChatMessage -: Send messages and save localy
 
*/



