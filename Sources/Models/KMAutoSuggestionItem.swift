//
//  KMAutoSuggestionItem.swift
//  KommunicateChatUI-iOS-SDK
//
//  Created by sathyan elangovan on 21/07/23.
//

import Foundation


public struct KMAutoSuggestionItem : Decodable {
    var placeholder: String
    var source: [String]
}


public struct KMAutoSuggestionObjectItem: Decodable {
    var placeholder: String
    var source : [KMAutoSuggestionObjectSource]
}

public struct KMAutoSuggestionObjectSource : Decodable{
    var searchKey: String
    var message: String
}
public struct KMAutoSuggestionApiItem : Decodable {
    var placeholder : String
    var source : KMAutoSuggestionApiSource
}

public struct KMAutoSuggestionApiSource: Decodable {
    var url: String
    var headers: [String:String]
}

public struct KMAutoSuggestionApiResponse {
    var searchKey: String
    var name: String
    var metadata: [String:String]?
}
