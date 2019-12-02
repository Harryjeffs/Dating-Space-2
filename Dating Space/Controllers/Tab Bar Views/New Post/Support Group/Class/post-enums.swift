//
//  post-enums.swift
//  Dating Space
//
//  Created by Harry Jeffs on 5/11/19.
//  Copyright © 2019 toPick. All rights reserved.
//

import Foundation
import UIKit

enum genders : String, Codable{
    case male
    case female
    case unspecifed
}

struct onboaringData{
    static var name: String = ""
    static var friend_id = ""
    static var description: String = ""
    static var gender: genders = .unspecifed
    static var cons = [String]()
    static var pros = [String]()
    static var socials = [[String]]()
    static var photos = [UIImage]()
    static var nsfwFlag: Bool = false
}
