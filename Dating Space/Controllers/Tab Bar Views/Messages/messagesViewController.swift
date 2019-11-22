//
//  messagesViewController.swift
//  Dating Space
//
//  Created by Harry Jeffs on 26/9/19.
//  Copyright © 2019 toPick. All rights reserved.
//

import UIKit

class messagesViewController: UIViewController {

    let comingSoonBanner = UILabel()
    let feedbackButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.title = "Messages"
        
        comingSoonBanner.frame = CGRect(x: 0, y: 0, width: view.width * 0.9, height: 450)
        comingSoonBanner.text = "This feature is coming soon. If you enjoy the app, and concept and want this sped up, fill out the form below. "
        comingSoonBanner.numberOfLines = 0
        comingSoonBanner.lineBreakMode = .byWordWrapping
        comingSoonBanner.font = UIFont(name: "Georgia-Bold", size: 30)!
        comingSoonBanner.textColor = UIColor(hexString: "#9facbd")
        comingSoonBanner.textAlignment = .center
        
        view.addSubview(comingSoonBanner)
        comingSoonBanner.anchorInCenter(width: comingSoonBanner.width, height: comingSoonBanner.height)
        
        feedbackButton.frame = CGRect(x: 0, y: 0, width: view.width * 0.5, height: 50)
        feedbackButton.setTitle("Give Feedback", for: .normal)
        feedbackButton.backgroundColor = .flatSkyBlueColor()
        feedbackButton.dropShadow()
        feedbackButton.roundCorners(corners: .allCorners, radius: 25)
        
        view.addSubview(feedbackButton)
        feedbackButton.align(.underCentered, relativeTo: comingSoonBanner, padding: 0, width: feedbackButton.width, height: feedbackButton.height)
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
