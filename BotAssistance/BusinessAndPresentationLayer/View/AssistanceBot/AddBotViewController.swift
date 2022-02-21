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




