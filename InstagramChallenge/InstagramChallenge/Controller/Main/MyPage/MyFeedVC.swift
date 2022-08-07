//
//  MyFeedVC.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/07.
//

import Foundation
import UIKit
class MyFeedVC : UIViewController{
    
    private let collectionViewFlowLayout: UICollectionViewFlowLayout = {
      let layout = UICollectionViewFlowLayout()
      layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0.5
        layout.minimumInteritemSpacing = 0.5
        layout.estimatedItemSize = .zero
      return layout
    }()

    //이미지 컬렉션 뷰
    lazy var postImageCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
       
      
//        let screenWidth = UIScreen.main.bounds.size.width
//        //layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
//        layout.itemSize = CGSize(width: screenWidth, height: 333)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.backgroundColor = .gray
        collectionView.register(PostImageCell.self, forCellWithReuseIdentifier: "PostImageCell")
        collectionView.isUserInteractionEnabled = true
        collectionView.showsVerticalScrollIndicator = true
        collectionView.isScrollEnabled = true
        
        
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postImageCollectionView.delegate = self
        postImageCollectionView.dataSource = self
        layout()
    }
    
    
    func layout(){
        self.view.addSubview(postImageCollectionView)
        postImageCollectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
extension MyFeedVC : UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostImageCell", for: indexPath) as? PostImageCell else {
            return UICollectionViewCell()
        }
        cell.numberContainer.isHidden = true
//        let url = URL(string: self.images![indexPath.row].contentsUrl)
//        cell.imageView.kf.setImage(with: url)
        return cell
    }
    


    
}
//사이즈 설정
extension MyFeedVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width : CGFloat = (collectionView.frame.width)
        
        return CGSize(width: width/3 - 2, height: width/3 - 2)
    }
}
