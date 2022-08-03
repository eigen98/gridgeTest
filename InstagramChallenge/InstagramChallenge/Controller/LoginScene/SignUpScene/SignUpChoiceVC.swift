//
//  SignUpChoiceVC.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/02.
//

import Foundation
import UIKit
//카카오 가입 or 전화번호 이메일 가입 선택 화면

class SignUpChoiceVC : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //휴대폰, email로 가입 버튼 클릭 이벤트
    @IBAction func tapPhoneEmailSignUpBtn(_ sender: UIButton) {
        guard let signupMainVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpMainVC") else {return }
        
        self.navigationController?.pushViewController(signupMainVC, animated: false)
        
    }
}
