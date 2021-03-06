//
//  facebookLoginExtension.swift
//  Dating Space
//
//  Created by Harry Jeffs on 22/9/19.
//  Copyright © 2019 toPick. All rights reserved.
//

import Foundation
//import FacebookLogin
import FacebookLogin
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

extension loginViewController : LoginButtonDelegate{

    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {

        if let error = error {
            print(error.localizedDescription)
            return
        }else{
            if let result = result{
                if !(result.isCancelled){
                    //Assign user to userDetails class.. permisson
                    userDetails.data.permittedPermissions = result.grantedPermissions
                    if let token = result.token{
                        let credential = FacebookAuthProvider.credential(withAccessToken: token.tokenString)
                        Auth.auth().signIn(with: credential){ (authResults, error) in
                            if let error = error{
                                print("Error", error)
                                return
                            }
                            if let auth = authResults{
                               if true{
                                    print("New User")
                                    let register = login()
                                    register.createNewUser(auth){ (success) -> Void in
                                        if success{
                                            self.performSegue(withIdentifier: "toHome", sender: self)
                                        }else{
                                            EZAlertController.alert("Error", message: "There was an error creating your account. Please try again later or use another account.")
                                        }
                                    }
                                }else{
                                    self.performSegue(withIdentifier: "toHome", sender: self)
                                    userDetails.data.uniqueID = auth.user.uid
                                    login().generateUserData()
                                }
                            }
                        }
                    }
                }else{
                    //EZAlertController - Alert the user cancelled the sign in and we cant procceed.
                }
            }
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        //Let's log the user out!
        
    }
}
