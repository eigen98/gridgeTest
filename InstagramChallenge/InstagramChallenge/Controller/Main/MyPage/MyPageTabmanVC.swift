//
//  MyPageTabmanVC.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/07.
//

import Foundation
import UIKit
import Tabman
import Pageboy

class MyPageTabmanVC : TabmanViewController {
    
    //상단 탭바에 들어갈 뷰컨 배열(내글, 내 태그)
    private var viewControllers: Array<UIViewController> = []

    
    
        override func viewDidLoad() {
            super.viewDidLoad()

            let myFeedVC = MyFeedVC()
            let myTagVC = MyTagVC()
                
           
            viewControllers.append(myFeedVC)
            viewControllers.append(myTagVC)
            
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


extension MyPageTabmanVC: PageboyViewControllerDataSource, TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        
        var item = TMBarItem(title: "")
       
        
        switch index {
        case 0 :
            item = TMBarItem(image: UIImage(named: "mypost_img")!)
            break
        case 1 :
            item = TMBarItem(image: UIImage(named: "mytag_img")!)
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
