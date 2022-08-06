//
//  LoginDataManager.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/04.
//

import Foundation
import Alamofire
import KeychainSwift

class LoginDataManager {
    //로그인
    func postLogin(_ parameters: LoginRequest, delegate: LoginVC) {
//        let header: HTTPHeaders = [ "Content-Type":"application/json",
//                                    "token":"\(RegisterBasicInfo.shared.token!)"]
        AF.request("\(Constant.BASE_URL)/app/sign-in", method: .post, parameters: parameters, encoder: JSONParameterEncoder())
            .validate()
            .responseDecodable(of: LoginResponse.self) { response in
                switch response.result {
                
                case .success(let response):
                    // 성공했을 때
                    switch response.code {
                    case 1000:
                        let keyChain = TokenManager.sharedKeyChain
                        keyChain.set((response.result?.jwt)!,forKey: "jwt")
                        print(response)
                        delegate.didSucessLogin()
                        
                        break
                    default:
                       // delegate.failedToRegisterManager(message: response.message)
                        delegate.failLogin(id: parameters.loginId)
                        break
                }
                case .failure(let error):
                    print(error.localizedDescription)
                  //  delegate.failedToRegisterManager(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
