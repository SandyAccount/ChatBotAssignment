//
//  ListBotViewModel.swift
//  BotAssistance
//
//  Created by Activ Health on 20/02/22.
//

import Foundation
import UIKit
protocol ListBotCallBack:NSObject {
    func fetchBotListSuccess(isSuccessa:Bool)
}
class ListBotViewModel:InitiateRemoveObserver {
    // MARK: - Global Variable Declaration
    weak var delegate:ListBotCallBack?
    // MARK: - View Model Initialization
    init(callBackDelegate:ListBotCallBack){
        delegate = callBackDelegate
        getBotList()
    }
    
    // MARK: - Fetch bot list from local
    private func getBotList(){
        ChatBotJson.sharedInstance.getBotDataFromLocalJson(objectType: ChatModel.self) { response in
            if response.chatData?.count ?? 0 > 0 {
                guard let arrayBotList = response.chatData?.sorted(by:{$0.sortDate ?? Date() > $1.sortDate ?? Date()}) else{
                    delegate?.fetchBotListSuccess(isSuccessa:false)
                    return
                }
                let arrayfilterChatCount = (arrayBotList.filter {($0.messages.count > 0)} + arrayBotList.filter {($0.messages.count < 1)})
                ChatBotJson.sharedInstance.arrayBot = arrayfilterChatCount
                delegate?.fetchBotListSuccess(isSuccessa:true)
            }
        } failure: { _ in
            delegate?.fetchBotListSuccess(isSuccessa:true)
        }
    }
    // MARK: - No Data
    func hideTableview() -> Bool {
        if ChatBotJson.sharedInstance.arrayBot?.count ?? 0 > 0{
            return false
        }else{
            return true
        }
    }
    // MARK: - InitiateRemoveObserver Protocol Method
    func initializedObserver(view:UIViewController){
        NotificationCenter.default.addObserver(view, selector: #selector((view as! ListBotViewController).routeToAddBot(notification:)), name:.Route, object: nil)
    }
    func deInitializedObserver(view:UIViewController){
        NotificationCenter.default.removeObserver(view, name: .Route, object: nil)
    }
}


