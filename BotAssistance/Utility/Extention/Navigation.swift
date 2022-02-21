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
        navigationItem.backButtonTitle = ""
        if isBackBarButton{
            let backImage = UIImage(named: "back")?.withRenderingMode(.alwaysTemplate)
            backImage?.withTintColor(UIColor.green)
            self.navigationController?.navigationBar.backIndicatorImage = backImage
            self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
            
        }
    }
    @objc func rightButtonAction(sender: UIBarButtonItem){
        NotificationCenter.default.post(name: NSNotification.Name("Route"), object: nil, userInfo: nil)
    }
}

extension Notification.Name {
    static let Route = Notification.Name("Route")
}
