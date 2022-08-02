//
//  LoginVC.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/07/31.
//

import Foundation
import UIKit
//로그인화면
class LoginVC : UIViewController {
    
    
    //가입하기 버튼
    @IBOutlet weak var signUpBtn: UIButton!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .white
        
    }
    
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
    //가입하기 버튼 클릭 이벤트 (-> 가입 방법 선택 화면 전환)
    @IBAction func tapSignUpBtn(_ sender: UIButton) {
        guard let signupMainVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpChoiceVC") else { return }
        signupMainVC.modalPresentationStyle = .fullScreen
        present(signupMainVC, animated: false)
    }
    
    
    
}
