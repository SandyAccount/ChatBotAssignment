//
//  ChatTableViewCell.swift
//  BotAssistance
//
//  Created by Activ Health on 21/02/22.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    // MARK: - Global Variable and Iboutlet
    @IBOutlet weak var viewSender: UIView!
    @IBOutlet weak var viewBot: UIView!
    @IBOutlet weak var labelSender: UILabel!
    @IBOutlet weak var labelBot: UILabel!
    // MARK: - Nib Initialization
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    // MARK: - Set Data with User Interface
    func setData(iIndex:Int,dataMessage:Messages){
        if dataMessage.sender == "User" {
            self.viewBot.isHidden = true
            self.viewSender.isHidden = false
            self.labelSender.text = dataMessage.message
        }else{
            self.viewBot.isHidden = false
            self.viewSender.isHidden = true
            self.labelBot.text = dataMessage.message
        }
    }
}
