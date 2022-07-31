//
//  LoginVC.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/07/31.
//

import Foundation
import UIKit

class LoginVC : UIViewController {
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    //계정 정보를 찾을 수 없음. Alert
    func notFindAccount(account : String){
        let sheet = UIAlertController(title: "계정을 찾을 수 없음",
                                      message: "\(account)에 연결된 계정을 찾을 수 없습니다. 다른 전화번호나 이메일 주소를 사용해보세요. Instagram 계정이 없으면 가입할 수 있습니다."
                                      , preferredStyle: .alert)
        
        sheet.addAction(UIAlertAction(title: "가입하기", style: .destructive, handler: { _ in print("가입하기 클릭") }))
                
        sheet.addAction(UIAlertAction(title: "다시 시도", style: .cancel, handler: { _ in print("다시 시도 클릭") }))
        
        
        
    }
    
    
    
    
}
