//
//  ExtentionChatViewController.swift
//  BotAssistance
//
//  Created by Activ Health on 21/02/22.
//

import Foundation
import UIKit
// MARK: - Tableview Datasource Delegate Method
extension ChatViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return ChatBotJson.sharedInstance.arrayBot?[iIndex!].messages.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Chat", for: indexPath) as! ChatTableViewCell
        if let bot = ChatBotJson.sharedInstance.arrayBot{
            cell.setData(iIndex: indexPath.row, dataMessage:bot[iIndex!].messages[indexPath.row])
        }
        
        return cell
    }
}
// MARK: - Tableview Delegate Method
extension ChatViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
// MARK: - SendMessage Custome Protocol
extension ChatViewController:SendMessageProtocol{
    func messageSend(){
        tableviewChat.reloadData()
        self.textViewMessage.text = ""
        buttonSendOutlet.isEnabled = false
    }
}
// MARK: - Textfield Delegate 
extension ChatViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // dismiss keyboard
        return true
    }
}
extension ChatViewController: UITextViewDelegate{
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder() // dismiss keyboard
        return true
    }
}


