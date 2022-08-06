//
//  SignupRequest.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/04.
//

import Foundation
struct SignupRequest: Encodable {
    var realName: String //이름 .. 그릿지
    var password: String //비밀번호
    var loginId: String //사용자 이름(아이디)
    var birthDate: String // 20011231
    var phoneNumber : String //전화번호
    
}

