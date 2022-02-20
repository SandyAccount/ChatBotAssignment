//
//  Navigation.swift
//  BotAssistance
//
//  Created by Activ Health on 18/02/22.
//

import Foundation
import UIKit

extension UINavigationController{
    func setNavigationTheme(isBackBarButton:Bool,isRightBarButton:Bool,navigationTitle:String){
        self.navigationBar.barTintColor = UIColor(red: 38.0/255, green: 47.0/255, blue: 73.0/255, alpha: 1.0)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationBar.titleTextAttributes = textAttributes
        if isRightBarButton{
           let image = UIImage(named: "add24")?.withRenderingMode(.alwaysOriginal)
            let btnAddBot = UIBarButtonItem()
            btnAddBot.image = image
            btnAddBot.target = self
            btnAddBot.action = #selector(rightButtonAction(sender:))
            self.navigationBar.topItem?.rightBarButtonItems =  [btnAddBot]
        }
//        if isBackBarButton{
//            let image = UIImage(named: "add24")?.withRenderingMode(.alwaysOriginal)
//             let btnAddBot = UIBarButtonItem()
//             btnAddBot.image = image
//             btnAddBot.target = self
//             btnAddBot.action = #selector(rightButtonAction(sender:))
//             self.navigationBar.topItem?.leftBarButtonItems =  [btnAddBot]
//        }
    }
    @objc func rightButtonAction(sender: UIBarButtonItem){
        NotificationCenter.default.post(name: NSNotification.Name("Route"), object: nil, userInfo: nil)
    }
}
