//
//  ListBotTableViewCell.swift
//  BotAssistance
//
//  Created by Sandesh on 21/02/22.
//

import UIKit

class ListBotTableViewCell: UITableViewCell {
    // MARK: - Global Variable Declaration
    @IBOutlet weak var labelBotName: UILabel!
    @IBOutlet weak var labelLastMessage: UILabel!
    @IBOutlet weak var labelBotInitial: UILabel!
    // MARK: - Nib Initialization
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    // MARK: - Set Data with user interface
    func setData(iIndex:Int){
        if let bot = ChatBotJson.sharedInstance.arrayBot{
            let data = bot[iIndex]
            self.labelBotName.text = data.botName
            self.labelBotInitial.text = data.botName?.getInitialLetter()
            if data.messages.count > 0 {
                self.labelLastMessage.text = data.messages[data.messages.count - 1].message
            }else{
                self.labelLastMessage.text = "-"
            }
        }
    }
}
