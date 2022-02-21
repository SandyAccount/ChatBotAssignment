//
//  CommonMethod.swift
//  BotAssistance
//
//  Created by Activ Health on 21/02/22.
//

import Foundation
import UIKit

class commonMethod {
    weak static var controller:UIViewController?
    static func showAlert(strTitle:String,strMessage:String){
        let alert = UIAlertController(title: strTitle, message: strMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.controller?.present(alert, animated: true, completion: nil)
    }
}

