//
//  KMAutoSuggestionItemCell.swift
//  KommunicateChatUI-iOS-SDK
//
//  Created by sathyan elangovan on 27/07/23.
//

import Foundation
import UIKit

class KMAutoSuggestionItemCell: UITableViewCell, AutoSuggestionItemCell {
    func updateView(item: AutoCompleteItem) {
        
    }
    
    func updateView(item: String) {
        nameLabel.text = item
    }
    
    enum Padding {
        enum Profile {
            static let left: CGFloat = 20
            static let width: CGFloat = 40
            static let height: CGFloat = 40
            static let top: CGFloat = 10
            static let bottom: CGFloat = 10
        }

        enum Name {
            static let left: CGFloat = 10
            static let right: CGFloat = 10
        }
    }

   

    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont(name: "HelveticaNeue", size: 15)
        label.textColor = UIColor.blue
        //UIColor(red: 89, green: 87, blue: 87)
        label.lineBreakMode = .byTruncatingTail
        return label
    }()

    var item: AutoCompleteItem?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

   

  

    
    class func rowHeight() -> CGFloat {
        return Padding.Profile.top + Padding.Profile.bottom + Padding.Profile.height
    }

    private func setupConstraints() {
        contentView.addViewsForAutolayout(views: [nameLabel])
        NSLayoutConstraint.activate([
//            profile.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Padding.Profile.left),
//            profile.widthAnchor.constraint(equalToConstant: Padding.Profile.width),
//            profile.heightAnchor.constraint(equalToConstant: Padding.Profile.height),
//            profile.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Padding.Profile.top),
//            profile.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Padding.Profile.bottom),
//            nameLabel.leadingAnchor.constraint(equalTo: con.trailingAnchor, constant: Padding.Name.left),
//            nameLabel.centerYAnchor.constraint(equalTo: profile.centerYAnchor),
//            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Padding.Name.right),
            
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Padding.Profile.left),
            nameLabel.heightAnchor.constraint(equalToConstant: Padding.Profile.height),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Padding.Profile.top),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Padding.Profile.bottom)
        ])
    }
}
