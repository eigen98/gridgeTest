//
//  AgreeTermsVC.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/04.
//

import Foundation
import UIKit


class AgreeTermsVC : UIViewController {
    
    @IBOutlet weak var allAgreeBtn: UIButton! //모두 동의
    
    @IBOutlet weak var firstCheckBox: UIButton! //이용약관
    
    @IBOutlet weak var secondCheckBox: UIButton! //데이터 정책
    
    @IBOutlet weak var thirdCheckBox: UIButton! //위치 기반 기능
    
    var signupRequest : SignupRequest? = nil
    
    var checkList = [false, false, false, false]
    var checkBox : [UIButton]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkBox =  [allAgreeBtn, firstCheckBox, secondCheckBox, thirdCheckBox]
    }
    
    @IBAction func tapAllCheckBox(_ sender: UIButton) {
        checkList[0] = !checkList[0]
        
        for i in 0...3 {
            updateCheckMark(button: checkBox?[i] ?? UIButton(), bool: checkList[0])
            checkList[i] = checkList[0]
        }
        //updateAllAgreeTerms()
    }
    
    @IBAction func tapFirstCheckBox(_ sender: UIButton) {
        checkList[1] = !checkList[1]
        updateAllAgreeTerms()
    }
    
    @IBAction func tapSecondCheckBox(_ sender: UIButton) {
        checkList[2] = !checkList[2]
        updateAllAgreeTerms()
    }
    
    @IBAction func tapThirdCheckBox(_ sender: UIButton) {
        checkList[3] = !checkList[3]
        updateAllAgreeTerms()
    }
    //계속 버튼 클릭 이벤트
    @IBAction func tapKeepBtn(_ sender: UIButton) {
        
        guard var createNameVC = self.storyboard?.instantiateViewController(withIdentifier: "CreateNameVC") as? CreateNameVC else { return  }
        createNameVC.signupRequest = self.signupRequest
        self.navigationController?.pushViewController(createNameVC, animated: false)
    }
    
    
    
    func updateAllAgreeTerms(){
        checkList[0] = [checkList[1],
                        checkList[2],
                        checkList[3]
        ].allSatisfy{$0}
        
        for i in 0...3 {
            updateCheckMark(button: checkBox?[i] ?? UIButton(), bool: checkList[i])
            
        }
    }
    
    func updateCheckMark(button : UIButton, bool : Bool){
        if bool {
            button.setImage(UIImage(named: "checked_btn_img") , for: .normal)
        }else {
            button.setImage(UIImage(named: "unchecked_btn_img"), for: .normal)
        }
    }
    
    
}
