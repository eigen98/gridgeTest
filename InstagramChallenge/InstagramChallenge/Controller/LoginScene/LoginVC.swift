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
    
    
    @IBOutlet weak var idField: UITextField!
    
    @IBOutlet weak var pwField: UITextField!
    
    
    let dataManager = LoginDataManager()
    
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
        
        
        sheet.addAction(UIAlertAction(title: "다시 시도", style: .default, handler: { _ in print("다시 시도 클릭")
            
            self.tryLogin()
            
        }))
        
        sheet.addAction(UIAlertAction(title: "가입하기", style: .default, handler: { _ in print("가입하기 클릭")
            
            self.moveSignUp()
        }))
                
        
        present(sheet, animated: true)
        
    }
    
    //가입하기 버튼 클릭 이벤트 (-> 가입 방법 선택 화면 전환)
    @IBAction func tapSignUpBtn(_ sender: UIButton) {
        moveSignUp()
        
    }
    
    
    //로그인 버튼 클릭 이벤트
    @IBAction func tapLoginBtn(_ sender: UIButton) {
        tryLogin()
        
    }
    
    
    
}

extension LoginVC {
    //
    func didSucessLogin(){
        print("로그인 성공")
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = mainStoryBoard.instantiateViewController(withIdentifier: "TabbarVC")
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    func failLogin(id : String){
        print("로그인 실패")
        notFindAccount(account: id)
    }
    
    func moveSignUp(){
        guard let signupChoiceVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpChoiceVC") else { return }

        let naviVC = UINavigationController(rootViewController: signupChoiceVC)
        naviVC.modalPresentationStyle = .fullScreen
        self.present(naviVC, animated: false)
    }
    
    func tryLogin(){
        if self.idField.text?.count ?? 0 > 0 && self.pwField.text?.count ?? 0 > 0 {
            var requestEntity = LoginRequest(loginId: self.idField.text ?? "" , password: self.pwField.text ?? "")
            
            dataManager.postLogin(requestEntity, delegate: self)
        }
    }
}
