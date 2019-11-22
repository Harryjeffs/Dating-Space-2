//
//  homeViewController.swift
//  Dating Space
//
//  Created by Harry Jeffs on 24/9/19.
//  Copyright © 2019 toPick. All rights reserved.
//

import UIKit
import VerticalCardSwiper


class homeViewController: UIViewController {
    
    var cardSwiper = VerticalCardSwiper()
    var lastContentOffset : CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ff")
        
        self.title = "Home"
        
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .white
        
        cardSwiper.frame = self.view.bounds
        cardSwiper.isSideSwipingEnabled = true
        cardSwiper.cardSpacing = 20
        cardSwiper.sideInset = 10
        
        view.addSubview(cardSwiper)
            
        cardSwiper.datasource = self
        cardSwiper.delegate = self
        
        cardSwiper.register(ExampleCardCell.self, forCellWithReuseIdentifier: "ExampleCell")
        print("gg")
        
        tabBarController?.tabBar.items?[0].title = "Home"
        tabBarController?.tabBar.items?[0].setIcon(icon: .icofont(.home), size: nil, textColor: .lightGray, backgroundColor: .clear, selectedTextColor: UIColor(hexString: "#0068DA"), selectedBackgroundColor: .clear)
               
        tabBarController?.tabBar.items?[1].title = "Notifications"
        tabBarController?.tabBar.items?[1].setIcon(icon: .icofont(.notification), size: nil, textColor: .lightGray, backgroundColor: .clear, selectedTextColor: UIColor(hexString: "#0068DA"), selectedBackgroundColor: .clear)
        
        tabBarController?.tabBar.items?[2].title = ""
        
        tabBarController?.tabBar.items?[3].title = "Messages"
        tabBarController?.tabBar.items?[3].setIcon(icon: .icofont(.mail), size: nil, textColor: .lightGray, backgroundColor: .clear, selectedTextColor: UIColor(hexString: "#0068DA"), selectedBackgroundColor: .clear)
               
        tabBarController?.tabBar.items?[4].title = "Settings"
        tabBarController?.tabBar.items?[4].setIcon(icon: .icofont(.settings), size: nil, textColor: .lightGray, backgroundColor: .clear, selectedTextColor: UIColor(hexString: "#0068DA"), selectedBackgroundColor: .clear)
    }
}
