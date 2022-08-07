//
//  NewFeedReqeust.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/07.
//

import Foundation
struct NewFeedReqeust : Codable {
    var feedText : String
    var contentsUrls : [String]
}
