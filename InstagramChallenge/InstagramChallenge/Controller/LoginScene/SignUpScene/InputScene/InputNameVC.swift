//
//  InputNameVC.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/03.
//

import Foundation
import UIKit

class InputNameVC : UIViewController {
    
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var clearBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    var signupRequest : SignupRequest? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        attribute()

        nameField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    func attribute(){
        clearBtn.isHidden = true
        nextBtn.isEnabled = false

        
    }
    
    @objc func textFieldDidChange(_ sender: Any?) {
        if self.nameField?.text?.count ?? 0 > 0 {
            clearBtn.isHidden = false
            nextBtn.isEnabled = true
            nextBtn.setImage(UIImage(named: "login_next_enable_btn_img"), for: .normal)
        }else{
            clearBtn.isHidden = true
            nextBtn.isEnabled = false
            nextBtn.setImage(UIImage(named: "login_next_disable_btn_img"), for: .normal)
            
        }
            
        
    }
    //지우기 버튼
    @IBAction func tapClearBtn(_ sender: UIButton) {
        nameField.text = ""
        clearBtn.isHidden = true
        nextBtn.isEnabled = false
        nextBtn.setImage(UIImage(named: "login_next_disable_btn_img"), for: .normal)
    }
    //다음 버튼
    @IBAction func tapNextBtn(_ sender: UIButton) {
        
        guard var passwordVC = self.storyboard?.instantiateViewController(withIdentifier: "InputPasswordVC") as? InputPasswordVC else { return  }
        self.signupRequest?.realName = self.nameField.text!
        passwordVC.signupRequest = self.signupRequest
        self.navigationController?.pushViewController(passwordVC, animated: false)
       
        
    }
 
//
//    
}
