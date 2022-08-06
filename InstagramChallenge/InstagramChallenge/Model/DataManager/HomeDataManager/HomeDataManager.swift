//
//  HomeDataManager.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/06.
//

import Foundation
import Alamofire

class HomeDataManager {
    let keychain = TokenManager.sharedKeyChain
    //피드
    func getFeedContents(page : Int , vc: HomeVC) {
        
        let token = "\(String(describing: keychain.get("jwt")!))"
        
        let url = "\(Constant.BASE_URL)/app/feeds?pageIndex=\(page)&size=10"
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                    "x-access-token":"\(token)"]
        
        AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: FeedResponse.self) { response in
                switch response.result {
                case .success(let response):
                    switch response.code {
                    case 1000:
                        print(response)
                        vc.didSuccessFeedLoad(contents: response.result ?? [])
                        
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
