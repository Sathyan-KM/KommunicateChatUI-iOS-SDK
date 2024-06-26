//
//  KMAutoCompleteManager+TableView.swift
//  KommunicateChatUI-iOS-SDK
//
//  Created by Mukesh on 29/05/19.
//

import Foundation
import UIKit

extension KMAutoCompleteManager: UITableViewDataSource, UITableViewDelegate {
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

        guard indexPath.row < items.count,
              let selection = selection
        else {
            if(isAutoSuggestion){
                let autoCompleteCellType = cellType(forPrefix: "")
                guard let autoCompleteCell = tableView.dequeueReusableCell( withIdentifier: autoCompleteCellType.reuseIdentifier, for: indexPath) as? KMAutoCompletionItemCell else {
                    return cell
                }
                isAutoSuggestion = false
                return autoCompleteCell
            }
            return cell
        }

        let autoCompleteCellType = cellType(forPrefix: selection.prefix)
        guard let autoCompleteCell = tableView.dequeueReusableCell(
            withIdentifier: autoCompleteCellType.reuseIdentifier,
            for: indexPath
        ) as? KMAutoCompletionItemCell else {
            return cell
        }
        autoCompleteCell.updateView(item: items[indexPath.row])
        return autoCompleteCell
    }

    public func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row < items.count else { return }
        let item = items[indexPath.row]
        guard let selection = selection else { return }

        insert(item: item, at: selection.range, replace: selection)
        cancelAndHide()
    }
}

public class DefaultAutoCompleteCell: UITableViewCell, KMAutoCompletionItemCell {
    public func updateView(item: KMAutoCompleteItem) {
        textLabel?.text = "\(item.content)"
        textLabel?.textColor = UIColor.kmDynamicColor(light: .black, dark: .white)
        backgroundColor = UIColor.kmDynamicColor(light: .white, dark: .appBarDarkColor())
    }
}
