//
//  FirebaseStorageManager.swift
//  InstagramChallenge
//
//  Created by JeongMin Ko on 2022/08/07.
//


import UIKit
import FirebaseStorage
import Firebase

class FirebaseStorageManager {
    static func uploadImage(image: UIImage, completion: @escaping (URL?) -> String){
        
        guard let imageData = image.jpegData(compressionQuality: 0.4) else { return  }
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
        let userName = UserDefaults.standard.value(forKey: "userName")
        let loginId = UserDefaults.standard.value(forKey: "loginId")
        let imageName = "\(userName)_\(UUID().uuidString) + \(String(Date().timeIntervalSince1970))"
        
        let firebaseReference = Storage.storage().reference().child("\(userName)/\(loginId)").child("\(imageName)")
        firebaseReference.putData(imageData, metadata: metaData) { metaData, error in
            firebaseReference.downloadURL { url, _ in
//                result = url?.description ?? ""
                print(url)
                completion(url)
                
            }
        }
    }
    
    static func downloadImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        let storageReference = Storage.storage().reference(forURL: urlString)
        let megaByte = Int64(1 * 1024 * 1024)
        
        storageReference.getData(maxSize: megaByte) { data, error in
            guard let imageData = data else {
                completion(nil)
                return
            }
            completion(UIImage(data: imageData))
        }
    }
}
