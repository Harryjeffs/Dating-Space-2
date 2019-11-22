//
//  structLoginData.swift
//  Dating Space
//
//  Created by Harry Jeffs on 23/9/19.
//  Copyright © 2019 toPick. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

struct userData {
    var admin = false
    var display_name = ""
    var friend_count = 0
    var friends = [String: Any]()
    var user = userStruct()
    struct userStruct {
        var ageRange = [0,0]
        var birthday = ""
        var email = ""
        var first_name = ""
        var last_name = ""
        var gender = ""
        var facebook_id = ""
        var settings = settingsStruct()
        struct settingsStruct {
            var banned = false
            var location = CLLocation()
            var looking_for = ""
        }
    }
    var picture = pictureStruct()
    struct pictureStruct {
        var size = CGSize()
        var is_silhouette = false
        var url = ""
    }
    var uuid = ""
}
