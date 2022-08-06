//
//  InputPasswordVC.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/03.
//

import Foundation
import UIKit
class InputPasswordVC : UIViewController {
    
    
    @IBOutlet weak var pwField: UITextField!
    
    @IBOutlet weak var clearBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var signupRequest : SignupRequest? = nil
    

    override func viewDidLoad() {
        super.viewDidLoad()

        attribute()

        pwField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    func attribute(){
        clearBtn.isHidden = true
        nextBtn.isEnabled = false
        pwField.keyboardType = .default

        
        
    }
//
    @objc func textFieldDidChange(_ sender: Any?) {
        if self.pwField?.text?.count ?? 0 > 0 {
            clearBtn.isHidden = false
            nextBtn.isEnabled = true
            nextBtn.setImage(UIImage(named: "login_next_enable_btn_img"), for: .normal)
        }else{
            clearBtn.isHidden = true
            nextBtn.isEnabled = false
            nextBtn.setImage(UIImage(named: "login_next_disable_btn_img"), for: .normal)

        }

    }
    
    
    @IBAction func tapClearBtn(_ sender: UIButton) {
        pwField.text = ""
        clearBtn.isHidden = true
        nextBtn.isEnabled = false
        nextBtn.setImage(UIImage(named: "login_next_disable_btn_img"), for: .normal)
    }
  
    @IBAction func tapNextBtn(_ sender: UIButton) {
        
        
        guard var birthVC = self.storyboard?.instantiateViewController(withIdentifier: "InputBirthVC") as? InputBirthVC else { return  }
        self.signupRequest?.password = self.pwField.text!
        birthVC.signupRequest = self.signupRequest
        self.navigationController?.pushViewController(birthVC, animated: false)
        
    }
   
}
