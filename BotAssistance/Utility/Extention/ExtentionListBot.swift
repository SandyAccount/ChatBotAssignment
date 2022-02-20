//
//  ExtentionListBot.swift
//  BotAssistance
//
//  Created by Activ Health on 20/02/22.
//

import Foundation
import UIKit
// MARK: - TableviewDataSource Delegate - ListBot
extension ListBotViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return ChatBotJson.sharedInstance.arrayBot?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableviewListBot.dequeueReusableCell(withIdentifier: "ListBot", for: indexPath) as! ListBotTableViewCell
        cell.setData(iIndex: indexPath.row)
        return cell
    }
}
// MARK: - TableviewDelegate - ListBot
extension ListBotViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatView = ChatViewController.loadChatView(strBotName:ChatBotJson.sharedInstance.arrayBot?[indexPath.row].botName ?? "", index: indexPath.row)
        self.navigationController?.pushViewController(chatView, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
// MARK: - Custome Protocol Call Back - CreateNewBot
extension ListBotViewController: CreateNewBot{
    internal func initiateNewBot(){
        tableviewListBot.reloadData()
    }
}


