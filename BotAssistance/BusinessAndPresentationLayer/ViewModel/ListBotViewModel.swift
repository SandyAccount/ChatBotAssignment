//
//  ListBotViewModel.swift
//  BotAssistance
//
//  Created by Activ Health on 20/02/22.
//

import Foundation
import UIKit
class ListBotViewModel {
    weak var controller: UIViewController?
    init(view:UIViewController){
        controller = view
        getBotList()
    }
    
    private func getBotList(){
        ChatBotJson.sharedInstance.getBotDataFromLocalJson(objectType: ChatModel.self) { response in
            if response.chatData?.count ?? 0 > 0 {
                guard let sort = (response.chatData?.sorted(by: {$0.date ?? "" < $1.date ?? ""})) else { return
                }
                ChatBotJson.sharedInstance.arrayBot = sort
            }
        }
    }
    // MARK: - Observer - Register Notification Observer
    func registerObserver()  {
        NotificationCenter.default.addObserver(controller ?? UIViewController(), selector: #selector((controller as! ListBotViewController).routeToAddBot(notification:)), name:.Route, object: nil)
    }
    // MARK: - Observer - Remove Notification Observer
    func removeObserver(){
        NotificationCenter.default.removeObserver(self, name: .Route, object: nil)
    }
}
