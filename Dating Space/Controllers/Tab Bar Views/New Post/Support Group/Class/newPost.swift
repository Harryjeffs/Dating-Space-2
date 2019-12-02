//
//  newPost.swift
//  Dating Space
//
//  Created by Harry Jeffs on 27/9/19.
//  Copyright © 2019 toPick. All rights reserved.
//

import Foundation
import Firebase
import FirebaseStorage

class newPost {
    
    var db : Firestore!
    var documentID: String = ""

    let storageRef = Storage.storage().reference()
    var imagePathArray = [String]()
    
    func createInitalPost(_ success: @escaping(_: Bool) -> Void ){
        db = Firestore.firestore()
        
        let postUID = UUID().uuidString
        imageUpload(postUID, completion: { imagesArray in
            self.db.collection("posts").document(postUID).setData([
                "age" : 0,
                "cons": onboaringData.cons,
                "pros": onboaringData.pros,
                "socials": onboaringData.socials,
                "description": onboaringData.description,
                "gender": onboaringData.gender.rawValue,
                "images": imagesArray,
                "status" : [
                    "approved": 0,
                    "approving_user": "/users/"+onboaringData.friend_id,
                ],
                "post_uid": postUID,
                "timestamp": NSDate().timeIntervalSince1970,
                "deleted": false,
                "posted_by": "/users/\(userDetails.data.uniqueID)",
            ]){ err in
                if let error = err{
                    //EZAlertController - alert we couldnt register the user.
                    print(error)
                    success(false)
                }else{
                    print("Successfully uploaded \(postUID)")
                    //Perform a segue to the home screen
                    //Assign user.uniqueID = auth.user.uid
                    //userDetails.data.uniqueID = auth.user.uid
                    //self.generateUserData()
                    success(true)
                }
            }
            //return documentID
        })
    }
    func imageUpload(_ postId: String, completion: @escaping (_ imagesArray: [String]) -> Void){
        let dispatchGroup = DispatchGroup()
        
        for singleImage in onboaringData.photos{
            let imageId = UUID().uuidString
            
            let imagePath = storageRef.child(postId + "/" + imageId + ".png")
            dispatchGroup.enter()
            
            if let uploadData = singleImage.jpegData(compressionQuality: 0.75) {
                let imageMetadata = StorageMetadata()
                imageMetadata.contentType = "image/jpeg"
                imagePath.putData(uploadData, metadata: imageMetadata) { (metadata, error) in
                    if error != nil {
                        self.imagePathArray.append(error.debugDescription)
                    } else {
                        self.imagePathArray.append(imageId)
                    }
                    dispatchGroup.leave()
                }
            }
        }
        dispatchGroup.notify(queue: .main) {
            completion(self.imagePathArray)
        }
    }
}
