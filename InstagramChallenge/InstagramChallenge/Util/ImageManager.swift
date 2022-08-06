//
//  ImageManager.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/06.
//

import Foundation
import Kingfisher
class ImageManager {
    static var shared = ImageManager()
    
    func loadImg(url : String) -> UIImage{
        var resultImage : UIImage?
        if let thumbnailUrl = URL(string: url) {
            KingfisherManager.shared.retrieveImage(with: thumbnailUrl, completionHandler: { result in
            switch(result) {
                case .success(let imageResult):
//                    let resized = imageResult.image.resizedImageWithContentMode(.scaleAspectFit, bounds: CGSize(width: 84, height: 84), interpolationQuality: .medium)
                    //imageView.isHidden = false
                resultImage = imageResult.image
                case .failure(let error):
                break
                }
            })
        }
        return resultImage ?? UIImage()
    }
    
}
