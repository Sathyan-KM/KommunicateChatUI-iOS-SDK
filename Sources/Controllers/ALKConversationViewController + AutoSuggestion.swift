//
//  ALKConversationViewController + AutoSuggestion.swift
//  KommunicateChatUI-iOS-SDK
//
//  Created by sathyan elangovan on 21/07/23.
//

import Foundation
import UIKit

extension ALKConversationViewController: AutoSuggestionDelegate {
    public func didMatchTwo(prefix: String, message: String) {
        guard prefix == MessageMention.Prefix else { return }

        let items = viewModel.fetchGroupMembersForAutocompletion()
        // update auto completion items based on the prefix
        if message.isEmpty {
            autocompleteManager.items = items
        } else {
            autocompleteManager.items = items.filter { $0.content.lowercased().contains(message) }
        }

        // Reload and show the view
        UIView.performWithoutAnimation {
            self.autocompleteManager.reloadAutoCompletionView()
        }
        autocompleteManager.hide(false)
    }
}
