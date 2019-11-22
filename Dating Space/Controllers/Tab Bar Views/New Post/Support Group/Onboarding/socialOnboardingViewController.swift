//
//  socialOnboardingViewController.swift
//  Dating Space
//
//  Created by Harry Jeffs on 29/9/19.
//  Copyright © 2019 toPick. All rights reserved.
//

import UIKit
import Neon
import SwiftMessages

class socialOnboardingViewController: UIViewController {

    let button = UIButton()
    
    let facebookIcon = UIImageView()
    let snapchatIcon = UIImageView()
    let twitterIcon = UIImageView()
    let instaGramIcon = UIImageView()
    
    var socialArray = [[UIImageView(), String()]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        socialArray = [[facebookIcon, "Facebook"],[snapchatIcon, "Snapchat"],[twitterIcon, "Twitter"], [instaGramIcon, "Instagram"]]
        self.navigationController?.navigationBar.isHidden = true
        
        facebookIcon.setUpSocialIcon(UIImage(named: "facebook")!)
        snapchatIcon.setUpSocialIcon(UIImage(named: "snapchat")!)
        twitterIcon.setUpSocialIcon(UIImage(named: "twitter")!)
        instaGramIcon.setUpSocialIcon(UIImage(named: "instagram")!)
        
        
        var i = 0
        socialArray.map({
            let image = $0[0] as! UIImageView
            image.tag = i
            image.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openContainer)))
            i = i + 1
        })

        view.addSubview(facebookIcon)
        view.addSubview(snapchatIcon)
        view.addSubview(twitterIcon)
        view.addSubview(instaGramIcon)
        
        view.groupInCenter(group: .horizontal, views: [facebookIcon, snapchatIcon, twitterIcon, instaGramIcon], padding: 10, width: 50, height: 50)
        
        let alert = UILabel(frame: CGRect(x: 0, y: 0, width: view.width *  0.9, height: 40))
        alert.text = "Social Media (optional)"
        alert.numberOfLines = 0
        alert.adjustsFontSizeToFitWidth = true
        alert.textColor = .black
        view.addSubview(alert)
        alert.align(.aboveMatchingRight, relativeTo: facebookIcon, padding: 10, width: alert.width, height: alert.height)
        
        // Do any additional setup after loading the view.
        button.frame = CGRect(x: 0, y: 0, width: view.width * 0.6, height: 50)
        button.setTitle("Next", for: .normal)
        button.backgroundColor = .flatSkyBlueColor()
        button.roundCorners(corners: [.allCorners], radius: 10)
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(toNe), for: .touchUpInside)
        view.addSubview(button)
        button.align(.underMatchingRight, relativeTo: facebookIcon, padding: 10, width: button.width, height: button.height)
        
        NotificationCenter.default.addObserver(self, selector: #selector(showSpinningWheel), name: NSNotification.Name(rawValue: "updateSocialIconTick"), object: nil)
    }

    // handle notification
    @objc func showSpinningWheel(_ notification: NSNotification) {
        print(notification.userInfo ?? "")
        if let dict = notification.userInfo as NSDictionary? {
            if let id = dict["index"] as? Int{
                 if let image = socialArray[id][0] as? UIImageView{
                     print(image)
                     image.addTickOverlay()
                 }
            }
        }
    }
    
    @objc func toNe(){
        NotificationCenter.default.post(name: Notification.Name("toNextPage"), object: nil)
    }
    @objc func openContainer(_ sender: UITapGestureRecognizer){
        guard let getTag = sender.view?.tag else { return }
         let creditsTableViewController = socialPopup()
        
        print("This prints (it really does)")
        let destination = UINavigationController(rootViewController: creditsTableViewController)
        let segue = SwiftMessagesSegue(identifier: nil, source: self, destination: destination)
        segue.messageView.backgroundHeight = UIWindow().frame.height * 0.2
        segue.configure(layout: .centered)
        
        creditsTableViewController.mainTitle.text = socialArray[getTag][1] as? String ?? ""
        segue.perform()
    }
}
extension UIImageView {
    func setUpSocialIcon(_ socialIcon: UIImage){
        frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        image = socialIcon
        contentMode = .scaleAspectFit
        isUserInteractionEnabled = true
    }
    func addTickOverlay(){
        let overlay = UIImageView()
        overlay.frame = frame
        overlay.roundCorners(corners: .allCorners, radius: 12)
        overlay.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        overlay.image = .init(icon: .icofont(.tickMark), size: CGSize(width: 30, height: 30), textColor: UIColor.flatGreenColor().withAlphaComponent(0.9), backgroundColor: .clear)
        addSubview(overlay)
    }
}
