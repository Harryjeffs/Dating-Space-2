//
//  classLogin.swift
//  Dating Space
//
//  Created by Harry Jeffs on 22/9/19.
//  Copyright © 2019 toPick. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import SwiftyJSON
import Firebase

class login {
    var db : Firestore!
    
    func createNewUser(_ auth: AuthDataResult,  success : @escaping (_: Bool) -> Void){
        db = Firestore.firestore()
        print("Users details from facebook", auth.additionalUserInfo?.profile)
        self.db.collection("users").document(auth.user.uid).setData([
            "friends": [
                "name": "none",
                "uid" : "none"
            ],
            "friend_count" : 0,
            "uuid": auth.user.uid,
            "display_name": auth.user.displayName as Any,
            "user_data": auth.additionalUserInfo?.profile as Any,
            "admin" : false,
            "user_settings" : [
                "banned": false,
                "looking_for": "male",
                "location": [
                    "lat" : userDetails.data.currentLocation.coordinate.latitude,
                    "lng" : userDetails.data.currentLocation.coordinate.longitude
                ]
            ]
        ]){ err in
            if let error = err{
                //EZAlertController - alert we couldnt register the user.
                print("Error registering user:", error)
                success(false)
            }else{
                //Perform a segue to the home screen
                //Assign user.uniqueID = auth.user.uid
                userDetails.data.uniqueID = auth.user.uid
                self.generateUserData()
                success(true)
            }
        }
    }
    
    func generateUserData(){
        var ref: DatabaseReference!

        ref = Database.database().reference()
        
        ref.child("users").child(userDetails.data.uniqueID).observeSingleEvent(of: .value, with: { (snapshot) in
          // Get user value
          print(snapshot)
            //userDetails.data.info = userData(admin: snapshot)
          }) { (error) in
            print(error.localizedDescription)
        }
    }
}
