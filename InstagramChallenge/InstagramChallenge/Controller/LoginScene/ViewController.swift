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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .white
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
          // 1초 후 실행될 부분
            //자동 로그인 구현 이전엔 바로 로그인화면 보여주기(임시)
            self.presentLoginView()
        }
        
        
    }
    
    //로그인 화면 present
    func presentLoginView(){
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "LoginVC") else {
            print("뷰컨 없음")
            return
            
        }
        print("present")
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }


}

