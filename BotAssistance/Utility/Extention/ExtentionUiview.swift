//
//  ExtentionUiview.swift
//  BotAssistance
//
//  Created by Activ Health on 21/02/22.
//

import Foundation
import UIKit

extension UIView{
    func setAttributToView(cornerRadius:CGFloat,borderWidth:CGFloat,borderColor:UIColor){
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
}
