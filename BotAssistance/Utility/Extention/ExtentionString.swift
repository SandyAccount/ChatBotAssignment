//
//  ExtentionString.swift
//  BotAssistance
//
//  Created by Activ Health on 21/02/22.
//

import Foundation
import UIKit

extension String{
    func validateEmpty() -> Bool{
        if isEmpty || self == ""{
            return false
        }
        return true
    }
}
