//
//  ViewController.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/07/31.
//

import UIKit
//시작 화면
class ViewController: UIViewController {

    //자동로그인
    //JWT토큰 만료
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //자동 로그인 구현 이전엔 바로 로그인화면 보여주기(임시)
        presentLoginView()
        
    }
    
    //로그인 화면 present
    func presentLoginView(){
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "LoginVC") else { return }
            self.present(viewController, animated: true, completion: nil)
    }


}

