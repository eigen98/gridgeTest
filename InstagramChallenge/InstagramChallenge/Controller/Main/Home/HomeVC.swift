//
//  HomeVC.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/06.
//

import Foundation
import UIKit

//홈화면
class HomeVC : UIViewController{
    
    @IBOutlet weak var newPhotoBtn: UIButton!
    @IBOutlet weak var feedTableView: UITableView!
    @IBOutlet weak var directBtn: UIButton!
    
    var dataManager = HomeDataManager()
    var feedContentsList : [FeedResult] = [] //피드 배열
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        dataManager.getFeedContents(page: 0, vc: self)
        
    }
    
    func setTableView(){
        feedTableView.delegate = self
        feedTableView.dataSource = self
        feedTableView.register(FeedCell.self, forCellReuseIdentifier: "FeedCell")
        feedTableView.register(StoryCell.self, forCellReuseIdentifier: "StoryCell")
    }
    //새로운 피드 내용 배열에 추가.
    func didSuccessFeedLoad(contents : [FeedResult]){
        //self.feedContentsList.append(contentsOf: contents)
        contents.forEach{
            self.feedContentsList.append($0)
        }
        
        self.feedTableView.reloadData()
    }
}

extension HomeVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            return self.feedContentsList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as! FeedCell
            cell.selectionStyle = .none
            cell.attribute(feedResult: self.feedContentsList[indexPath.row])
            
            return cell
            
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StoryCell", for: indexPath) as! StoryCell
            cell.selectionStyle = .none
            
            return cell
        }
    }
    
    
    
    
}
