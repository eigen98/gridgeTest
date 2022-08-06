//
//  CreateNameVC.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/04.
//

import Foundation
import UIKit
//사용자 이름 만들기
class CreateNameVC : UIViewController {
    
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var clearBtn: UIButton!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var warningLabel: UILabel!
    
    var signupRequest : SignupRequest? = nil
    
    let dataManager = SignupDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameField.addTarget(self, action:#selector(textFieldDidChange(_:)), for: .editingChanged)
        
    }
    
    @IBAction func tapNextBtn(_ sender: UIButton) {
        
        
        dataManager.getCheckDupId(loginId: self.nameField.text!, delegate: self)
        
    }
    @IBAction func tapClearBtn(_ sender: UIButton) {
//        nameField.text = ""
//        clearBtn.isHidden = true
//        nextBtn.isEnabled = false
//        nextBtn.setImage(UIImage(named: "login_next_disable_btn_img"), for: .normal)
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
}

extension CreateNameVC {
    //사용가능 아이디
    func availableId(){
        //색 변경
        warningLabel.isHidden = true
        clearBtn.layer.borderColor = UIColor(red: 0.741, green: 0.741, blue: 0.741, alpha: 1).cgColor
        //사용가능 마크 보여주기
        clearBtn.setImage(UIImage(named: "passed_img"), for: .normal)
        //버튼 원상태로 돌리기
        UIView.animate(withDuration: 1.0) {
                        self.nextBtn.transform = .identity
                    }
       
        //체크 표시 보여주기.
        guard var finalVC =  self.storyboard?.instantiateViewController(withIdentifier: "FinalSignupVC") as? FinalSignupVC else { return  }
        self.signupRequest?.loginId = nameField.text!
        finalVC.signupRequest = self.signupRequest
        self.navigationController?.pushViewController(finalVC, animated: false)
        
    }
    
    //사용 불가 Id
    func unavailableId(){
        //경고 문구 보이기
        warningLabel.isHidden = false
        nameField.layer.borderColor = UIColor(red: 0.957, green: 0.263, blue: 0.212, alpha: 1).cgColor
        //버튼 아래로 이동.
        UIView.animate(withDuration: 1) {
            let scale = CGAffineTransform(translationX: 0, y:32)
            self.nextBtn.transform = scale
            }

    }
}
