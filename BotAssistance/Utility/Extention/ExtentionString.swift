//
//  ExtentionString.swift
//  BotAssistance
//
//  Created by Sandesh on 21/02/22.
//

import Foundation
import UIKit

extension String{
    // MARK: - Empty String Validation
    func validateEmpty() -> Bool{
        let strTrimmed = self.trimmingCharacters(in: .whitespacesAndNewlines)
        if strTrimmed.isEmpty || strTrimmed == ""{
            return false
        }
        return true
    }
    // MARK: - Fetch Initial Letter from String
    func getInitialLetter() -> String{
        var finalString:String?
        let splitString = self.split(separator: " ")
        if splitString.count > 1 {
            finalString = String(String(splitString[0]).prefix(1)) + splitString[splitString.count - 1].prefix(1)
            return finalString ?? "AB"
        }else if splitString.count == 1 {
            finalString = String(splitString[0].prefix(1))
            return finalString ?? "AB"
        }
        return "AB"
    }
}
