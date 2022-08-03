//
//  SignUpTabmanVC.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/01.
//

import Foundation
import UIKit
import Tabman
import Pageboy

class SignUpTabmanVC : TabmanViewController {
    
    //상단 탭바에 들어갈 뷰컨 배열(전화번호로 가입, 이메일로 가입)
    private var viewControllers: Array<UIViewController> = []

    
    
        override func viewDidLoad() {
            super.viewDidLoad()

            let phoneVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PhoneSignVC") as! PhoneSignVC
            let emailVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EmailSignVC") as! EmailSignVC
                
           
            viewControllers.append(phoneVC)
            viewControllers.append(emailVC)
            
            self.dataSource = self

            // Create bar
            let bar = TMBar.ButtonBar()
            bar.layout.transitionStyle = .snap // Customize

            bar.layout.alignment = .centerDistributed // .center시 선택된 탭이 가운데로 오게 됨.
            bar.layout.contentMode = .fit
            
            // 인디케이터 조정
            bar.indicator.weight = .light
            bar.indicator.tintColor = .black
            bar.indicator.overscrollBehavior = .compress
            bar.layout.alignment = .centerDistributed
            
            bar.layout.interButtonSpacing = 35 // 버튼 사이 간격
            
            bar.layout.transitionStyle = .snap // Customize
            
            // Add to view
            addBar(bar, dataSource: self, at: .top)
        }
    
}


extension SignUpTabmanVC: PageboyViewControllerDataSource, TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        
        var item = TMBarItem(title: "")
       
        
        switch index {
        case 0 :
            item = TMBarItem(title: "전화번호")
            break
        case 1 :
            item = TMBarItem(title: "이메일")
        default:
            item = TMBarItem(title: "00")
        }
        
        
        
        return item
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }

    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}
