//
//  ALKEmptyCell.swift
//  KommunicateChatUI-iOS-SDK
//
//  Created by apple on 19/11/18.
//

import Foundation
import UIKit

class ALKEmptyView: UITableViewHeaderFooterView {
    static let reuseIdentifier = "EmptyChatCell"
    
    static var nib: UINib {
        return UINib(nibName: "EmptyChatCell", bundle: Bundle.km)
    }
    
    @IBOutlet var startNewConversationButtonIcon: UIButton!
    @IBOutlet var conversationLabel: UILabel!
}
