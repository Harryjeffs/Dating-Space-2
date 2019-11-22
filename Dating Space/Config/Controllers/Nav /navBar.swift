//
//  navBar.swift
//  Dating Space
//
//  Created by Harry Jeffs on 26/9/19.
//  Copyright © 2019 toPick. All rights reserved.
//

import UIKit
class navControllerViewController: UINavigationController {

     override func viewDidLoad() {
            super.viewDidLoad()
            
            if #available(iOS 13.0, *) {
                let appearance = UINavigationBarAppearance()
                appearance.backgroundColor = .white
                appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
                appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]

                UINavigationBar.appearance().tintColor = .white
                UINavigationBar.appearance().standardAppearance = appearance
                UINavigationBar.appearance().compactAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
            } else {
                UINavigationBar.appearance().tintColor = .white
                UINavigationBar.appearance().barTintColor = .white
                UINavigationBar.appearance().isTranslucent = false
            }
           // navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            if #available(iOS 11.0, *) {
                navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
                navigationBar.prefersLargeTitles = true
                navigationItem.largeTitleDisplayMode = .always
            }
        }

}
