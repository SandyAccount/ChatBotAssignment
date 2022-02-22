//
//  AddBotViewController.swift
//  BotAssistance
//
//  Created by Sandesh on 21/02/22.
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
    var botViewModel:AddBotViewModel?
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
            commonMethod.controller = self
            commonMethod.showAlert(strTitle: "Error!", strMessage: "Please enter bot name")
            return
        }
        botViewModel = AddBotViewModel()
        botViewModel?.updateBotData(botName: textFieldBotName.text ?? "", Completion: { result in
            if result{
                delegate?.initiateNewBot()
                self.dismiss(animated: true, completion: nil)
            }else{
                commonMethod.showAlert(strTitle: "Error!", strMessage: "Something went wrong...")
            }
        })
    }
}
// MARK: - TextField Delegate Method
extension AddBotViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // dismiss keyboard
        return true
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
/*
 Note -:
 1. AddBotViewController -> View
 2. AddBotViewModel -> View Model
 3. Delegate method used to indicate botlist about new bot creation
 */




