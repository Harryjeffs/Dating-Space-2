//
//  initalViewController.swift
//  Dating Space
//
//  Created by Harry Jeffs on 24/9/19.
//  Copyright © 2019 toPick. All rights reserved.
//

import UIKit
import Firebase
import CyaneaOctopus
import OneSignal
class initalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        DispatchQueue.main.async(){
            UIColor.gradientColor(view: self.view, colors: [UIColor(hexString: "#00d2ff"), UIColor(hexString: "#3a47d5")], direction: .leftToRight)
            if let user = Auth.auth().currentUser{
                print("User is signed in.")
                print(user.uid)
                userDetails.data.isLoggedIn = true
                userDetails.data.uniqueID = user.uid
                
                OneSignal.setExternalUserId(user.uid)
                notifications().sendNotification(user_id: ["DnIxqgwI7uMfHaXUrwzmosNke252"], type: .approve_post, name: "James", post_id: "B7ABFE1A-EC8D-4517-9561-682AF88EB8C3")
               // login().populateUserData()
                self.performSegue(withIdentifier: "initalToHome", sender: self)
            } else {
                print("User is not signed in.")
                self.performSegue(withIdentifier: "toLogin", sender: self)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
