//
//  KMAutoSuggestionItem.swift
//  KommunicateChatUI-iOS-SDK
//
//  Created by sathyan elangovan on 21/07/23.
//

import Foundation

public struct KMAutoSuggestionItem {
    var placeholder: String
    var source: [String]
}

public struct KMAutoSuggestionSourceObject {
    var searchKey: String
    var message: String
}

public struct KMAutoSuggestionApiSource {
    var url: String
    var headers: [String:String]
}

public struct KMAutoSuggestionApiResponse {
    var searchKey: String
    var name: String
    var metadata: [String:String]?
}
