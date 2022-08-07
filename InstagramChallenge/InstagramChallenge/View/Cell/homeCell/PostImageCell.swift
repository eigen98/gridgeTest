//
//  PostImageCell.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/06.
//

import Foundation
import UIKit

class PostImageCell : UICollectionViewCell {
    
    var imageView = UIImageView()
    var numberContainer = UIView()
    var numberLabel = UILabel()
    
    
    func layout(){
        
        self.contentView.addSubview(imageView)
        self.contentView.addSubview(numberContainer)
        self.numberContainer.addSubview(numberLabel)
//        self.contentView.snp.makeConstraints{
//            let screenWidth = UIScreen.main.bounds.size.width
//            $0.width.equalTo(screenWidth)
//            $0.height.equalTo(333)
//        }
        imageView.backgroundColor = .white
        imageView.snp.makeConstraints{
            
           
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.top.equalToSuperview()
            
        }
        
        numberContainer.snp.makeConstraints{
            $0.trailing.equalTo(imageView.snp.trailing).inset(15)
            $0.top.equalTo(imageView.snp.top).offset(10)
            $0.width.equalTo(34)
            $0.height.equalTo(26)
        }

        numberLabel.snp.makeConstraints{
            $0.centerX.equalTo(numberContainer.snp.centerX)
            $0.centerY.equalTo(numberContainer.snp.centerY)
        }
    }
    func attribute(){
        numberContainer.layer.cornerRadius = 13
        numberContainer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        numberContainer.alpha = 0.7
        numberLabel.font = .systemFont(ofSize: 12, weight: .regular)
        numberLabel.textColor = .white
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
        attribute()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
}
extension UITableViewCell {
    open override func addSubview(_ view: UIView) {
        super.addSubview(view)
        sendSubviewToBack(contentView)
    }
}
