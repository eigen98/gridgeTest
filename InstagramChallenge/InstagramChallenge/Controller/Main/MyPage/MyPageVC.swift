//
//  MyPageVC.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/07.
//

import Foundation
import UIKit
class MyPageVC : UIViewController {
    
    @IBOutlet weak var userIdLabel: UILabel!
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var myFeedNumber: UILabel!
    
    @IBOutlet weak var myFollowerNumber: UILabel!
    @IBOutlet weak var myFollowingNumber: UILabel!
    @IBOutlet weak var profileModifyBtn: UIButton!
    var dataManager = MyPageDataManager()
   
    
    var tabContainer = UIView()
    var tabmanVC = MyPageTabmanVC() //탭맨 뷰컨(내 글, 내 태그)
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        self.view.backgroundColor = .white
        dataManager.getMyData(vc: self)
        
       
        
    }
    func layout(){

        self.view.addSubview(tabContainer)
        self.tabContainer.snp.makeConstraints{
            $0.top.equalTo(profileModifyBtn.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }

        //상단 탭바 해당 뷰컨에 추가.
        addChild(tabmanVC)
        tabmanVC.view.frame = tabContainer.frame
        tabContainer.addSubview(tabmanVC.view)
    }
//
    func attribute(response : MyPageResult){
        self.userIdLabel.text =  response.loginId
        self.userNameLabel.text = response.realName
        self.myFeedNumber.text = response.feedCount.description
//        self.myFollowerNumber.text = response.followerCount.description
        self.myFollowingNumber.text = response.followingCount.description
        self.myFollowerNumber.text =
        response.followerCount.description
        
    }
}
