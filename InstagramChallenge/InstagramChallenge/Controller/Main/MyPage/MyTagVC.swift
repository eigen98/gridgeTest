//
//  MyTagVC.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/07.
//

import Foundation
import UIKit
class MyTagVC : UIViewController{
    
    
    var descriptionImg =  UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        descriptionImg.image = UIImage(named: "mytag_description_img")
    }
    
    func layout(){
        self.view.addSubview(descriptionImg)
        descriptionImg.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(76)
            $0.top.equalToSuperview().offset(100)
            $0.height.equalTo(222)
        }
        
    }
}
