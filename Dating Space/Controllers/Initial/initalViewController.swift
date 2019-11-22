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

class initalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        DispatchQueue.main.async(){
            UIColor.gradientColor(view: self.view, colors: [UIColor(hexString: "#00d2ff"), UIColor(hexString: "#3a47d5")], direction: .leftToRight)
            if Auth.auth().currentUser != nil {
                print("User is signed in.")
                userDetails.data.isLoggedIn = true
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
