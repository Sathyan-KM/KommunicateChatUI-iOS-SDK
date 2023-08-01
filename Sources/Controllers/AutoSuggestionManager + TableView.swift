//
//  AutoSuggestionManager + TableView.swift
//  KommunicateChatUI-iOS-SDK
//
//  Created by sathyan elangovan on 21/07/23.
//

import Foundation
import UIKit

extension KMAutoSuggestionManager: UITableViewDataSource, UITableViewDelegate {
    public func numberOfSections(in _: UITableView) -> Int {
        return 1
    }

    public func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return items.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell! =
            tableView.dequeueReusableCell(withIdentifier: UITableViewCell.reuseIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: UITableViewCell.reuseIdentifier)
        }

        guard indexPath.row < items.count
//              let selection = selection
        else {
            return cell
        }

        let autoCompleteCellType = cellType()
        guard let autoCompleteCell = tableView.dequeueReusableCell(
            withIdentifier: autoCompleteCellType.reuseIdentifier,
            for: indexPath
        ) as? AutoSuggestionItemCell else {
            return cell
        }
        autoCompleteCell.updateView(item: items[indexPath.row])
        return autoCompleteCell
    }

    public func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row < items.count else { return }
        let item = items[indexPath.row]
        guard let selection = selection else { return }

//        insert(item: item, at: selection.range, replace: selection)
        cancelAndHide()
    }
}

public class DefaultAutoSuggestionCell: UITableViewCell, AutoSuggestionItemCell {
    public func updateView(item: String) {
        textLabel?.text = item
        //"\(item.content)"
    }
}
