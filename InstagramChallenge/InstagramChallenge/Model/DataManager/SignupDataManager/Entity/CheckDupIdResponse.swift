//
//  CheckDupIdResponse.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/04.
//

import Foundation
struct CheckDupIdResponse : Decodable{
    var isSuccess: Bool
    var code: Int
    var message: String
}
