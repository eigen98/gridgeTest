//
//  InputPhoneVC.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/03.
//

import Foundation
import UIKit
//전화번호 입력 화면
class InputCodeVC : UIViewController {
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var phoneField: UITextField!
    
    @IBOutlet weak var clearBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
        
        phoneField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    func attribute(){
        clearBtn.isHidden = true
        nextBtn.isEnabled = false
        
        phoneField.keyboardType = .numberPad
    }
    
    @IBAction func tapNextBtn(_ sender: UIButton) {
        guard var inputNameVC = self.storyboard?.instantiateViewController(withIdentifier: "InputNameVC") else { return  }
        self.navigationController?.pushViewController(inputNameVC, animated: false)
        
    }
    
    @IBAction func tapClearBtn(_ sender: UIButton) {
        phoneField.text = ""
        clearBtn.isHidden = true
        nextBtn.isEnabled = false
        nextBtn.setImage(UIImage(named: "login_next_disable_btn_img"), for: .normal)
    }
    
    @objc func textFieldDidChange(_ sender: Any?) {
        if self.phoneField?.text?.count ?? 0 > 0 {
            clearBtn.isHidden = false
            nextBtn.isEnabled = true
            nextBtn.setImage(UIImage(named: "login_next_enable_btn_img"), for: .normal)
        }else{
            clearBtn.isHidden = true
            nextBtn.isEnabled = false
            nextBtn.setImage(UIImage(named: "login_next_disable_btn_img"), for: .normal)
            
        }
            
        
    }
    
    @IBAction func tapBackBtn(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
    
}
