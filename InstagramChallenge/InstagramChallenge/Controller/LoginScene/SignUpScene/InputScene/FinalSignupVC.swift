//
//  FinalSignupVC.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/04.
//

import Foundation
import UIKit
//~님으로 가입하시겠어요?
class FinalSignupVC : UIViewController {
    
    @IBOutlet weak var loginIdLabel: UILabel!
    
    var signupRequest : SignupRequest? = nil
    
    let dataManager = SignupDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        
        print(self.signupRequest)
        
    }
    
    func attribute(){
        self.loginIdLabel.text = signupRequest?.loginId
    }
    @IBAction func tapSignupBtn(_ sender: UIButton) {
        dataManager.postSignUp(signupRequest!, delegate: self)
    }
}

extension FinalSignupVC {
    func didSuccessSignup(){
        print("가입 성공")
        
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = mainStoryBoard.instantiateViewController(withIdentifier: "TabbarVC")
        vc.modalPresentationStyle = .fullScreen
        
        self.changeRootViewController(vc)
        

    }
    func didFailSignup(){
        
    }
}
