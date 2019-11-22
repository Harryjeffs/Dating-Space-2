//
//  loginViewController.swift
//  Dating Space
//
//  Created by Harry Jeffs on 22/9/19.
//  Copyright © 2019 toPick. All rights reserved.
//

import UIKit
import CoreLocation
import FacebookLogin
import Firebase
import Neon

class loginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("login")
        
        self.view.backgroundColor = .systemRed
        
        let loginButton = FBLoginButton(frame: CGRect(x: 0, y: 0, width: view.width * 0.6, height: 40), permissions: [.userFriends, .userBirthday, .userGender, .userLocation])
        loginButton.delegate = self
        loginButton.defaultAudience = .onlyMe
        
        view.addSubview(loginButton)
        
        loginButton.anchorInCenter(width: loginButton.frame.width, height: loginButton.frame.height)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        if userDetails.data.isLoggedIn{
            DispatchQueue.main.async(){
                print("sending user through")
                self.performSegue(withIdentifier: "toHome", sender: self)
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
