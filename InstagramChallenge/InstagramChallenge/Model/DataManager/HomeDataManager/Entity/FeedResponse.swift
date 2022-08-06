//
//  FeedResponse.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/06.
//

import Foundation

struct FeedResponse : Codable {
    
    let isSuccess: Bool
    let code : Int
    let message: String
    let result : [FeedResult]?
}

struct FeedResult : Codable {
    
    var feedId : Int
    var feedLoginId : String
    var feedText : String
    var feedCreatedAt : String
    var feedUpdatedAt : String
    var feedCommentCount : Int
    var contentsList : [Content]?
    
}

struct Content : Codable {
    var contentsId : Int
    var contentsUrl : String
    var createdAt : String
    var updatedAt : String
}
