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
    static func loadCreateBotView(addBotDelegate:CreateNewBot) -> AddBotViewController{
        let botView = AddBotViewController(nibName: "AddBotViewController", bundle: nil)
        botView.delegate = addBotDelegate
        botView.modalPresentationStyle = .overFullScreen
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
        if !(textFieldBotName.text?.validateEmpty() ?? false){
            self.dismiss(animated: true, completion: nil)
            return
        }
        InitiateBot.initiateBot(strBotName: textFieldBotName.text ?? "", strBotCreatedDate: "\(Date())") { success in
            delegate?.initiateNewBot()
            self.dismiss(animated: true, completion: nil)
        }
     }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
/*
Note -:
 1. AddBotViewController -> View
 2. InitiateBot Class perform action to create new bot and save in local json
 3. Delegate method used to indicate botlist about new bot creation
*/




