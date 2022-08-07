//
//  MyPageDataManager.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/07.
//


import Foundation
import Alamofire

class MyPageDataManager {
    let keychain = TokenManager.sharedKeyChain
    //피드
    
    func getMyName() {
        let loginId = UserDefaults.standard.value(forKey: "loginId")!
        let token = "\(String(describing: keychain.get("jwt")!))"
        print("my id is : \(String(describing: loginId))")
        let url = "\(Constant.BASE_URL)/app/users/\(String(describing: loginId))/my-page"
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                    "x-access-token":"\(token)"]
        
        AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: MyPageResponse.self) { response in
                switch response.result {
                case .success(let response):
                    switch response.code {
                    case 1000:
                        print(response)
                        UserDefaults.standard.set(response.result?.realName, forKey: "userName")
                        UserDefaults.standard.set(response.result?.loginId, forKey: "loginId")
                        
                        break
                    default:
                        print(response)
                        break
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    
                }
            }
    }
    
    func getMyData( vc: MyPageVC) {
        let loginId = UserDefaults.standard.value(forKey: "loginId")!
        let token = "\(String(describing: keychain.get("jwt")!))"
        
        let url = "\(Constant.BASE_URL)/app/users/\(String(describing: loginId))/my-page"
        print("my id is : \(String(describing: loginId))")
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                    "x-access-token":"\(token)"]
        
        AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: MyPageResponse.self) { response in
                switch response.result {
                case .success(let response):
                    switch response.code {
                    case 1000:
                        print(response)
                        UserDefaults.standard.set(response.result!.realName, forKey: "userName")
                        UserDefaults.standard.set(response.result!.loginId, forKey: "loginId")
                        vc.attribute(response: response.result!)
                        break
                    default:
                        print(response)
                        break
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    
                }
            }
    }
}
