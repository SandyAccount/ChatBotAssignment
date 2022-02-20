//
//  AddBotViewController.swift
//  BotAssistance
//
//  Created by Activ Health on 18/02/22.
//

import UIKit

// MARK: - Protocol - Reload tableview after created new bot
protocol CreateNewBot {
    func initiateNewBot()
}
class AddBotViewController: UIViewController {
    // MARK: - Iboutlet and Global Variable Declaration
    @IBOutlet weak var textFieldBotName: UITextField!
    var delegate:CreateNewBot?
    // MARK: - Nib Initialization
    static func loadCreateBotView() -> AddBotViewController{
        let botView = AddBotViewController(nibName: "AddBotViewController", bundle: nil)
        return botView
    }
    // MARK: - View Life Cycle Delegate Method
    override func viewDidLoad() {
        super.viewDidLoad()
     }
    // MARK: - Button Click event
    @IBAction func buttonCancelClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buttonSubmitClicked(_ sender: Any) {
        InitiateBot.initiateBot(strBotName: textFieldBotName.text ?? "", strBotCreatedDate: "\(Date())") { success in
            delegate?.initiateNewBot()
            self.dismiss(animated: true, completion: nil)
        }
     }
}



/*view.endEditing(true)
var dataBotArray:Data?
let botObject = ChatData(strBotName: textFieldBotName.text ?? "", strDate: "\(Date())")
ChatBotJson.sharedInstance.arrayBot?.append(botObject)
let newBotObject = ["data":ChatBotJson.sharedInstance.arrayBot]
if let encoded = try? JSONEncoder().encode(newBotObject) {
    dataBotArray = encoded//try JSONSerialization.data(withJSONObject:encoded)
}
guard let documentDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
let fileUrl = documentDirectoryUrl.appendingPathComponent("Bot.json")
try? dataBotArray!.write(to: fileUrl)
delegate?.initiateNewBot()
self.dismiss(animated: true, completion: nil)
////////////////////////////////////////////////////////////////////////////////////////////
let botObject = ["data":[["botName":textFieldBotName.text ?? "","date":"\(Date())"]]] as [String : Any]
var chatData: ChatModel?
var data:Data?
var dataBotArray:Data?
do{
    data = try JSONSerialization.data(withJSONObject:botObject)
    chatData = try JSONDecoder().decode(ChatModel.self, from: data!)
    print(chatData!)
    if let _ = ChatBotJson.sharedInstance.arrayBot{
        ChatBotJson.sharedInstance.arrayBot?.append(chatData!.chatData![0])
    }else{
        ChatBotJson.sharedInstance.arrayBot = chatData?.chatData
    }
    let newBotObject = ["data":ChatBotJson.sharedInstance.arrayBot]
    
    if let encoded = try? JSONEncoder().encode(newBotObject) {
        print(encoded)
        dataBotArray = encoded//try JSONSerialization.data(withJSONObject:encoded)
    }
 }catch{
    
}
guard let documentDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
    let fileUrl = documentDirectoryUrl.appendingPathComponent("Bot.json")
try? dataBotArray!.write(to: fileUrl)
delegate?.initiateNewBot()
self.dismiss(animated: true, completion: nil)*/



