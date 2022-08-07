//
//  HomeVC.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/06.
//

import Foundation
import UIKit
import YPImagePicker
//홈화면
class HomeVC : UIViewController{
    
    @IBOutlet weak var newPhotoBtn: UIButton!
    @IBOutlet weak var feedTableView: UITableView!
    @IBOutlet weak var directBtn: UIButton!
    
    var isPaging: Bool = false // 현재 페이징 중인지 체크하는 flag
    var hasNextPage: Bool = true // 마지막 페이지 인지 체크 하는 flag

    
    var dataManager = HomeDataManager()
    var feedContentsList : [FeedResult] = [] //피드 배열
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        
        
    }
    
    func paging(feeds :[FeedResult] ) {
//            let index = feedContentsList.count / 10
//
//            var datas: [FeedResult] = []
//
        
        
    
//            for i in index..<(index + 10) {
//                let data = feeds
//                datas.append(data[i])
//            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.feedContentsList.append(contentsOf: feeds) // 데이터는 계속해서 append 시켜줌 (페이징의 핵심!)
                
                self.hasNextPage = self.feedContentsList.count > 300 ? false : true // 다음 페이지가 있는지 여부를 표시
                self.isPaging = false // 페이징이 종료 되었음을 표시
                
                self.feedTableView.reloadData()
            }
        }
    
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
        
        dataManager.getFeedContents(vc: self)
            
        }
    
    func setTableView(){
        feedTableView.delegate = self
        feedTableView.dataSource = self
        feedTableView.register(FeedCell.self, forCellReuseIdentifier: "FeedCell")
        feedTableView.register(StoryCell.self, forCellReuseIdentifier: "StoryCell")
        feedTableView.register(LoadingCell.self, forCellReuseIdentifier: "LoadingCell")
    }
    //새로운 피드 내용 배열에 추가.
    func didSuccessFeedLoad(contents : [FeedResult]){
        //self.feedContentsList.append(contentsOf: contents)
        contents.forEach{
            self.feedContentsList.append($0)
        }
       
//        self.hasNextPage = self.feedContentsList.count > 300 ? false : true // 다음 페이지가 있는지 여부를 표시
        self.isPaging = false // 페이징이 종료 되었음을 표시
        self.hasNextPage = self.feedContentsList.count > 300 ? false : true
        
        self.feedTableView.reloadData()
    }
    //새 게시글 올리기 버튼
    @IBAction func tapNewPhotoBtn(_ sender: UIButton) {
        
        // YPImagePicker 설정
        var config = YPImagePickerConfiguration()
        config.library.mediaType = .photo
        config.shouldSaveNewPicturesToAlbum = false
        config.startOnScreen = .library
        config.screens = [.library]
        config.hidesStatusBar = false
        config.hidesBottomBar = false
        config.library.maxNumberOfItems = 10
        
        let picker = YPImagePicker(configuration: config)
        picker.modalPresentationStyle = .fullScreen
        
        present(picker, animated: true, completion: nil)
        
        // 이미지 선택 또는 취소버튼 누른 후 기존 화면으로 돌아가기
        didFinishPickingMedia(picker)
        
    }
    
    // 이미지 선택 후에 돌아가기
    func didFinishPickingMedia(_ picker: YPImagePicker) {
        picker.didFinishPicking { [unowned picker] items, cancelled in
            var pickedIMG : [UIImage] = []
            
            if cancelled {
                //self.navigationController?.popViewController(animated: true)
                picker.dismiss(animated: true, completion: nil)
                return
            }
            
            // 여러 이미지를 넣어주기 위해 하나씩 넣어주는 반복문
            for item in items {
                switch item {
                    // 이미지만 받기때문에 photo case만 처리
                case .photo(let p):
                    // 이미지를 해당하는 이미지 배열에 넣어주는 code
                    pickedIMG.append(p.image)
                    break
                default:
                    print("")
                    break
                    
                }
                
            }
            print("게시글 작성하러 가기")
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "NewPostVC") as? NewPostVC else {
                return
            }
            vc.modalPresentationStyle = .fullScreen
            vc.images = pickedIMG
            pickedIMG.forEach{
                FirebaseStorageManager.uploadImage(image: $0, completion: { url in
                    if let url = url {
                        vc.urls.append(url.description)
                        print("이미지 url 추가.")
                        return url.description
                        
                    }
                    return ""
                })
            }
            
            picker.present(vc, animated: true)
            
            
//                                picker.dismiss(animated: true) {
//                                    // picker뷰 dismiss 할 때 이미지가 들어가 있는 collectionView reloadData()
//                                    //self.imageCV.reloadData()
//                                }
        }
    }
}

extension HomeVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else if section == 1 {
            return self.feedContentsList.count
        }else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as! FeedCell
            //cell.selectionStyle = .none
            cell.attribute(feedResult: self.feedContentsList[indexPath.row])
            return cell
            
        }else if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StoryCell", for: indexPath) as! StoryCell
            cell.selectionStyle = .none
            
            return cell
            
        }else if indexPath.section == 2 && isPaging{
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoadingCell", for: indexPath) as! LoadingCell
            cell.selectionStyle = .none
            
            //cell.showIndicator()
            return cell
        }else{
            
        }
        return UITableViewCell()
    }
    
    
    
    
}

extension HomeVC {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.height
        
        // 스크롤이 테이블 뷰 Offset의 끝에 가게 되면 다음 페이지를 호출
        if offsetY > (contentHeight - height) {
            if isPaging == false && hasNextPage {
                beginPaging()
            }
        }
    }
    
    func beginPaging() {
        isPaging = true // 현재 페이징이 진행 되는 것을 표시
        // Section 1을 reload하여 로딩 셀을 보여줌 (페이징 진행 중인 것을 확인할 수 있도록)
        DispatchQueue.main.async {
            self.feedTableView.reloadSections(IndexSet(integer: 2), with: .none)
        }
        
        // 페이징 메소드 호출
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.dataManager.getFeedContents( vc: self)
        }
        
        
    }
}
