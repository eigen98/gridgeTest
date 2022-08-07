//
//  NewPostDataManager.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/07.
//

import Foundation
import Alamofire

class NewPostDataManager {
    //새 게시글 올리기
    let keychain = TokenManager.sharedKeyChain
    //로그인
    func postNewFeed(_ parameters: NewFeedReqeust, delegate: NewPostVC) {
        let token = "\(String(describing: keychain.get("jwt")!))"
        
        //let url = "\(Constant.BASE_URL)/app/feeds?pageIndex=\(page)&size=10"
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                    "x-access-token":"\(token)"]
        
        AF.request("\(Constant.BASE_URL)/app/feed", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: header)
            .validate()
            .responseDecodable(of: NewFeedResponse.self) { response in
                switch response.result {
                
                case .success(let response):
                    // 성공했을 때
                    switch response.code {
                    case 1000:
                      
                        print("업로드 완료")
                        
                        delegate.didSuccessUpload()
                        
                        break
                    default:
                       // delegate.failedToRegisterManager(message: response.message)
                       // delegate.failLogin(id: parameters.loginId)
                        break
                }
                case .failure(let error):
                    print(error.localizedDescription)
                  //  delegate.failedToRegisterManager(message: "서버와의 연결이 원활하지 않습니다")
                }
            }
    }
}

