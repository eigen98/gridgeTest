//
//  SignupResponse.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/04.
//

import Foundation
struct SignupResponse: Decodable {
    let isSuccess: Bool
    let code : Int
    let message: String
    let result : JWT?
}
struct JWT : Decodable {
    var jwt : String
}
