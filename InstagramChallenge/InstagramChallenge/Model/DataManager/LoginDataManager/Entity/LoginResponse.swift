//
//  LoginResponse.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/04.
//

import Foundation
struct LoginResponse : Decodable{
    var isSuccess : Bool
    var code : Int
    var message : String
    var result : LoginResult?
    
}

struct LoginResult : Decodable {
    var jwt : String
    var loginId : String
}
