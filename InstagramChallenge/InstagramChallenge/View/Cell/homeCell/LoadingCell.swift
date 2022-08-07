//
//  LoadingCell.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/07.
//

import Foundation
import UIKit
class LoadingCell : UITableViewCell{
    
    let containerView = UIView()
    let activityIndicator = UIActivityIndicatorView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.containerView)
        
        self.containerView.snp.makeConstraints{
            $0.height.equalTo(80)
            let screenWidth = UIScreen.main.bounds.size.width
            $0.width.equalTo(screenWidth)
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        //self.containerView.frame = self.contentView.frame
        //self.containerView.center = self.contentView.center
        self.containerView.backgroundColor = .clear
        
        self.containerView.addSubview(self.activityIndicator)
        activityIndicator.hidesWhenStopped = true
        
        //self.activityIndicator.center = self.containerView.center
        activityIndicator.snp.makeConstraints{
            $0.width.height.equalTo(40)
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        show()
        //showIndicator()
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func show() {
//        let window = UIWindow(frame: UIScreen.main.bounds)
        
        self.activityIndicator.style = .medium
        self.activityIndicator.color = .darkGray
        
        print("인디케이터 보이기")
        self.activityIndicator.startAnimating()
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
        }
        
        
       
        
        //UIApplication.shared.windows.first?.addSubview(self.containerView)
    }
    
    func showIndicator() {
        //self.containerView.backgroundColor = UIColor(hex: 0x000000, alpha: 0.4)
        
        
        self.activityIndicator.startAnimating()
    }
    
    func dismiss() {
        self.activityIndicator.stopAnimating()
        self.containerView.removeFromSuperview()
    }
    
}
