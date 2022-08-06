//
//  FeedCell.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/06.
//

import Foundation
import UIKit
import Kingfisher
//게시글 셀
class FeedCell : UITableViewCell {
    
    var images : [Content]?
    
    
    // 상단 사용자 정보 //cell_profile_img
    lazy var profileImgView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .tertiaryLabel
        return imageView
        
    }()
    //작성자
    lazy var userNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 13.5, weight: .medium)
        
        
        return label
    }()
    //위치
    lazy var addressLabel : UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 11.5, weight: .regular)
        //label.text = "\(String(describing: feedResult?.))"
        return label
    }()
    //메뉴 버튼
    lazy var menuBtn : UIButton = {
        let button = UIButton()
//        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.setImage(UIImage(systemName: "cell_profile_img"), for: .normal)
        return button
    }()
    
//    //이미지
//    lazy var postImageView : UIImageView = {
//        let imageView = UIImageView()
//        imageView.backgroundColor = .tertiaryLabel
//        return imageView
//    }()
    //이미지 컬렉션 뷰
    private lazy var postImageCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 0.5
//        layout.minimumInteritemSpacing = 0.5
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .gray
        collectionView.register(PostImageCell.self, forCellWithReuseIdentifier: "PostImageCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isScrollEnabled = true
        
        
        return collectionView
    }()
    
    
    //좋아요 버튼
    lazy var likeButton : UIButton = {
        let button = UIButton()
//        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.setImage(systemName: "heart")
        return button
    }()
    //댓글 버튼
    lazy var commentButton : UIButton = {
        let button = UIButton()
//        button.setImage(UIImage(systemName: "message"), for: .normal)
        button.setImage(systemName: "message")
        return button
    }()
    //디엠 버튼
    private lazy var directMessageButton : UIButton = {
        let button = UIButton()
//        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
        button.setImage(systemName: "paperplane")
        return button
    }()
    //저장하기 버튼
    private lazy var bookmarkButton : UIButton = {
        let button = UIButton()
//        button.setImage(UIImage(systemName: "bookmark"), for: .normal)
        button.setImage(systemName: "bookmark")
        return button
    }()
    //텍스트
    lazy var contentsLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13.0, weight: .medium)
        label.numberOfLines = 5
       // label.text = "\(String(describing: feedResult?.feedText))"
        return label
    }()
    //현재 좋아요 수
    private lazy var dateLabel : UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 11.0, weight: .medium)
        label.text = "1일전"
        return label
    }()
    
    //현재 좋아요 수
    private lazy var currentLikedCountLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13.0, weight: .semibold)
        label.text = "홍길동님 외 32명이 좋아합니다."
        return label
    }()
    //레이아웃에 추가.
    func layout(){
        [
            profileImgView,
            userNameLabel,
            menuBtn,
            postImageCollectionView,
            likeButton,
            commentButton,
            directMessageButton,
            currentLikedCountLabel,
            bookmarkButton,
            contentsLabel,
            dateLabel
        ].forEach{
            addSubview($0)
        }
        
        profileImgView.snp.makeConstraints{
            $0.width.height.equalTo(32)
            $0.leading.equalToSuperview().offset(10)
            $0.top.equalToSuperview().offset(10)
            
        }
        
        userNameLabel.snp.makeConstraints{
            $0.leading.equalTo(profileImgView.snp.trailing).offset(5)
            $0.centerY.equalTo(profileImgView.snp.centerY)
        }
        
        
        menuBtn.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(10)
            $0.centerY.equalTo(profileImgView.snp.centerY)
            $0.width.equalTo(15)
            $0.height.equalTo(3)
        }
        
        postImageCollectionView.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(profileImgView.snp.bottom).offset(10)
            $0.height.equalTo(postImageCollectionView.snp.width)
        }
        
        let buttonWidth : CGFloat = 24.0
        let buttonInset : CGFloat = 16.0
        // 버튼 오토 레이아웃
        likeButton.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(buttonInset)
            $0.top.equalTo(postImageCollectionView.snp.bottom).offset(buttonInset)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }
        commentButton.snp.makeConstraints{
            $0.leading.equalTo(likeButton.snp.trailing).offset(12.0)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }
        directMessageButton.snp.makeConstraints{
            $0.leading.equalTo(commentButton.snp.trailing).offset(12.0)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }
        bookmarkButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(buttonInset)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }
        
        //라벨 오토레이아웃
        currentLikedCountLabel.snp.makeConstraints{
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
            $0.top.equalTo(likeButton.snp.bottom).offset(14.0)
        }
        contentsLabel.snp.makeConstraints{
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
            $0.top.equalTo(currentLikedCountLabel.snp.bottom).offset(8.0)
        }
        dateLabel.snp.makeConstraints{
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookmarkButton.snp.trailing)
            $0.top.equalTo(contentsLabel.snp.bottom).offset(8.0)
            $0.bottom.equalToSuperview().inset(16.0)
        }
        
        
        
        
        
    }
   
    
    func attribute(feedResult : FeedResult?){
        self.contentsLabel.text = feedResult?.feedText
        self.userNameLabel.text = feedResult?.feedLoginId
        self.images = feedResult?.contentsList
        postImageCollectionView.reloadData()
    
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layout()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

extension FeedCell : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return images?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostImageCell", for: indexPath) as! PostImageCell
        cell.numberLabel.text = "1/\(images!.count)"
        let url = URL(string: self.images![indexPath.row].contentsUrl)
        cell.imageView.kf.setImage(with: url)
        return cell
    }
    
    
    
}
