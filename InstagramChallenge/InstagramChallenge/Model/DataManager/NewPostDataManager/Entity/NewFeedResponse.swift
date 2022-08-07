//
//  NewFeedResponse.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/07.
//

import Foundation

struct NewFeedResponse : Codable {
    var isSuccess : Bool
    var code : Int
    var message : String
}
