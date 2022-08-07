//
//  NewPostVC.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/07.
//

import Foundation
import UIKit
//이미지 선택후 게시글 내용 작성 화면

class NewPostVC : UIViewController {
    
    var images : [UIImage]? = nil
    var urls : [String] = []
    
    var dataManager = NewPostDataManager()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var contentText: UITextView!
    @IBOutlet weak var coverView: UIView!
    let textViewPlaceHolder = "문구 입력..."
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.imageView.image = self.images?[0]
        contentText.textColor = .lightGray
        contentText.delegate = self
        coverView.isHidden = true
        
    }
    
    //뒤로가기 (이미지 선택 화면으로 이동.)
    @IBAction func tapBackBtn(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    //공유하기 버튼 클릭 이벤트
    @IBAction func tapUploadBtn(_ sender: UIButton) {

        self.dataManager.postNewFeed(.init(feedText: self.contentText.text, contentsUrls: urls), delegate: self)
    }
    
    
}
extension NewPostVC : UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == textViewPlaceHolder {
            textView.text = nil
            textView.textColor = .black
        }
        coverView.isHidden = false
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = textViewPlaceHolder
            textView.textColor = .lightGray
        }
        coverView.isHidden = true
    }
    
    
    func didSuccessUpload(){
        var preVC = self.presentingViewController
        self.dismiss(animated: true){
            preVC?.dismiss(animated: false)
        }
    }
}

