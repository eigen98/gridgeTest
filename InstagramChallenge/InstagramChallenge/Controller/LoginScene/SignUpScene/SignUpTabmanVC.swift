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

            // Add to view
            addBar(bar, dataSource: self, at: .top)
        }
    
}


extension SignUpTabmanVC: PageboyViewControllerDataSource, TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let item = TMBarItem(title: "")
        item.title = "Page \(index)"
        item.image = UIImage(named: "image.png")
        // ↑↑ 이미지는 이따가 탭바 형식으로 보여줄 때 사용할 것이니 "이미지가 왜 있지?" 하지말고 넘어가주세요.
        
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
