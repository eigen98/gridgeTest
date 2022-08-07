//
//  MyPageResponse.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/07.
//

import Foundation
struct MyPageResponse : Codable {
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : MyPageResult?
}
struct MyPageResult : Codable{
    var loginId : String
    var realName : String
    var followerCount : Int
    var followingCount : Int
    var feedCount : Int
}
