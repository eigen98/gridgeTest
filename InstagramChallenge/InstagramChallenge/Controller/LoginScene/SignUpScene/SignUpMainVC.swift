//
//  SignUpMainVC.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/01.
//

import Foundation
import UIKit
import SnapKit

//회원가입 화면 최상위 뷰
class SignUpMainVC : UIViewController{
    
    
    var tabContainer = UIView()
    var tabmanVC = SignUpTabmanVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        
        
    }
    func layout(){
        
        self.view.addSubview(tabContainer)
        self.tabContainer.snp.makeConstraints{
            $0.top.equalToSuperview().offset(180)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        //상단 탭바 해당 뷰컨에 추가.
        addChild(tabmanVC)
        tabmanVC.view.frame = tabContainer.frame
        tabContainer.addSubview(tabmanVC.view)
    }
}
