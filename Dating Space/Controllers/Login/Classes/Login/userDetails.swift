//
//  userDetails.swift
//  Dating Space
//
//  Created by Harry Jeffs on 22/9/19.
//  Copyright © 2019 toPick. All rights reserved.
//

import Foundation
import CoreLocation

class userDetails : NSObject {
    static let data: userDetails = userDetails()
    
    //Relating to the users location services.
    var currentLocation = CLLocation()
    
    //General information regarding user
    var isPremium = false
    var permittedPermissions = Set<String>()
    var completedTutorial = false
    var uniqueID = "unspecfied"
    
    //where we add everything to the user.
    var info : currentUser?
    
    // If user has loaded the app and have loaded their categories
    var isLoggedIn = false
}
