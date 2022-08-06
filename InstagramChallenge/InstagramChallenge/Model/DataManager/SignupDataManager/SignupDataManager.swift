//
//  SignupDataManager.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/04.
//

import Foundation
import Alamofire
import KeychainSwift
class SignupDataManager{
    //아이디 중복 체크 요청
    func getCheckDupId(loginId : String, delegate : CreateNameVC){
        let url = "\(Constant.BASE_URL)/app/check-duplicate-login-id?loginId=\(loginId)"
                
//                let header: HTTPHeaders = [ "Content-Type":"application/json",
//                                             "token":"\(UserDefaults.standard.string(forKey: "token")!)"]
                
                AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: nil)
                    .validate()
                    .responseDecodable(of: CheckDupIdResponse.self) { response in
                        switch response.result {
                        case .success(let response):
                            switch response.code {
                            case 1000: //성공
                                delegate.availableId()
                                break
                            default:
                                delegate.unavailableId()
                                break
                                //vc.failedToRequestMyPageManagerContent(message: response.message!)
                            }
                            
                        case .failure(let error):
                            print(error.localizedDescription)
                            //vc.failedToRequestMyPageManagerContent(message: "서버와의 연결이 원활하지 않습니다")
                        }
                    }

    }
    //회원가입
    func postSignUp(_ parameters: SignupRequest, delegate: FinalSignupVC) {

//        let header: HTTPHeaders = [ "Content-Type":"application/json",
//                                    "token":"\(RegisterBasicInfo.shared.token!)"]
        
        AF.request("\(Constant.BASE_URL)/app/sign-up", method: .post, parameters: parameters, encoder: JSONParameterEncoder())
            .validate()
            .responseDecodable(of: SignupResponse.self) { response in
                switch response.result {
                
                case .success(let response):
                    // 성공했을 때
                    switch response.code {
                    case 1000:
                        let keyChain = TokenManager.sharedKeyChain
                        keyChain.set((response.result?.jwt)!,forKey: "jwt")
                        delegate.didSuccessSignup()
                        print(response)
                        break
                    default:
                       // delegate.failedToRegisterManager(message: response.message)
                        print(response.message)
                        break
                }
                case .failure(let error):
                    print(error.localizedDescription)
                  //  delegate.failedToRegisterManager(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}
