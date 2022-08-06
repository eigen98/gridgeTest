//
//  StoryCell.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/06.
//

import Foundation
import UIKit
class StoryCell : UITableViewCell{
    
    
    // 상단 사용자 정보 //cell_profile_img
    private lazy var profileImgView : UIImageView = {
        let imageView = UIImageView()
        //imageView.backgroundColor = .tertiaryLabel
        imageView.image = UIImage(named: "new_story_img")
        return imageView
    }()
   
    func layout(){
        addSubview(profileImgView)
        profileImgView.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(8)
            $0.width.equalTo(60)
            $0.height.equalTo(80)
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview().inset(10)
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
