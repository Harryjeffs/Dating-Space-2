//
//  tabBarController.swift
//  Dating Space
//
//  Created by Harry Jeffs on 26/9/19.
//  Copyright © 2019 toPick. All rights reserved.
//

import UIKit
import SwiftIcons
class tabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstTabNavigationController = navControllerViewController.init(rootViewController: homeViewController())
            let secondTabNavigationControoller = navControllerViewController.init(rootViewController: notificationsViewController())
            let thirdTabNavigationController = navControllerViewController.init(rootViewController: newPostViewController())
            let fourthTabNavigationController = navControllerViewController.init(rootViewController: messagesViewController())
            let fifthTabNavigationController = navControllerViewController.init(rootViewController: settingsViewController())
            viewControllers = [firstTabNavigationController, secondTabNavigationControoller, thirdTabNavigationController, fourthTabNavigationController, fifthTabNavigationController]
        
        delegate = self
        // Do any additional setup after loading the view.
        self.setValue(customTabBar(), forKey: "tabBar")
        setupMiddleButton()
        
    }
    // TabBarButton – Setup Middle Button
    func setupMiddleButton() {

        let middleBtn = UIButton(type: .custom)
        middleBtn.frame = CGRect(x: (self.view.bounds.width / 2)-25, y: -20, width: 50, height: 50)
        
        middleBtn.layer.masksToBounds = true
        middleBtn.layer.cornerRadius = middleBtn.frame.height / 2
        //STYLE THE BUTTON YOUR OWN WAY
        
        UIColor.gradientColor(view: middleBtn, colors: [UIColor(red: 75.0/255, green: 207/255, blue: 250/255, alpha: 1.0),UIColor(red: 25/255, green: 159/255, blue: 249/255, alpha: 1.0)], direction: .leftToRight)
        
        middleBtn.setIcon(icon: .icofont(.plus), color: .white, forState: .normal)
                
        //add to the tabbar and add click event
        self.tabBar.addSubview(middleBtn)
        middleBtn.addTarget(self, action: #selector(self.menuButtonAction), for: .touchUpInside)

       // self.view.layoutIfNeeded()
    }

    // Menu Button Touch Action
    @objc func menuButtonAction(sender: UIButton) {
        self.selectedIndex = 2   //to select the middle tab. use "1" if you have only 3 tabs.
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
