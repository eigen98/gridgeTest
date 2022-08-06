//
//  PhoneSignVC.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/01.
//

import Foundation
import UIKit
//전화번호 입력 화면
class PhoneSignVC : UIViewController {
    
    @IBOutlet weak var phoneField: UITextField!
    
    @IBOutlet weak var textClearBtn: UIButton!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var inputContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
        
        self.phoneField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    func attribute(){
        textClearBtn.isHidden = true
        nextBtn.isEnabled = false
        
        phoneField.keyboardType = .numberPad
        inputContainer.layer.cornerRadius = 8
        inputContainer.layer.borderWidth = 1
        inputContainer.layer.borderColor = UIColor(red: 0.816, green: 0.816, blue: 0.816, alpha: 1).cgColor
        
    }
    
    
    
    @IBAction func tapClearBtn(_ sender: UIButton) {
        phoneField.text = ""
        textClearBtn.isHidden = true
        nextBtn.isEnabled = false
        nextBtn.setImage(UIImage(named: "login_next_disable_btn_img"), for: .normal)
    }
    @IBAction func tapNextBtn(_ sender: UIButton) {
        print("tap nextBtn")
        guard let inputCodeVC = self.storyboard?.instantiateViewController(withIdentifier: "InputCodeVC") as? InputCodeVC else { return  }
        inputCodeVC.signupRequest = SignupRequest(realName: "",
                                                  password: "",
                                                  loginId: "",
                                                  birthDate: "",
                                                  phoneNumber: self.phoneField.text ?? "")
        let naviVC = UINavigationController(rootViewController: inputCodeVC)
        naviVC.modalPresentationStyle = .fullScreen
        self.present(naviVC, animated: false)
        
    }
    
    @objc func textFieldDidChange(_ sender: Any?) {
        if self.phoneField?.text?.count ?? 0 > 0 {
            textClearBtn.isHidden = false
            nextBtn.isEnabled = true
            nextBtn.setImage(UIImage(named: "login_next_enable_btn_img"), for: .normal)
        }else{
            textClearBtn.isHidden = true
            nextBtn.isEnabled = false
            nextBtn.setImage(UIImage(named: "login_next_disable_btn_img"), for: .normal)
            
        }
            
        
    }
}
