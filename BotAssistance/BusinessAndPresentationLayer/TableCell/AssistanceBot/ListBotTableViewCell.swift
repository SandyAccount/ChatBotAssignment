//
//  ListBotTableViewCell.swift
//  BotAssistance
//
//  Created by Activ Health on 18/02/22.
//

import UIKit

class ListBotTableViewCell: UITableViewCell {
    @IBOutlet weak var labelBotName: UILabel!
    @IBOutlet weak var labelLastMessage: UILabel!
    @IBOutlet weak var labelBotInitial: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func setData(iIndex:Int){
        if let bot = ChatBotJson.sharedInstance.arrayBot{
            let data = bot[iIndex]
            self.labelBotName.text = data.botName
            if data.messages.count > 0 {
                self.labelLastMessage.text = data.messages[data.messages.count - 1].message
            }else{
                self.labelLastMessage.text = "-"
            }
        }
    }
}
