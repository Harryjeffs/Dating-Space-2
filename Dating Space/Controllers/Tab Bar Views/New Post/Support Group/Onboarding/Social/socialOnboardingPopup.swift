//
//  socialOnboardingPopup.swift
//  Dating Space
//
//  Created by Harry Jeffs on 29/9/19.
//  Copyright © 2019 toPick. All rights reserved.
//

import Foundation
import UIKit

class socialPopup: UIViewController{
    let currentTitle : String = "Snapchat"
    let titleIndex: Int = 0
    let input = UITextField()
    let mainTitle = UILabel()
    let saveBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        mainTitle.frame = CGRect(x: 0, y: 0, width: view.width * 0.5, height: 40)
        mainTitle.font = .boldSystemFont(ofSize: 27)
        view.addSubview(mainTitle)
        mainTitle.anchorInCorner(.topLeft, xPad: 10, yPad: 10, width: mainTitle.width, height: mainTitle.height)
        view.backgroundColor = .white
        
        input.frame = CGRect(x: 0, y: 0, width: view.width * 0.9, height: 50)
        input.roundCorners(corners: .allCorners, radius: 5)
        input.layer.borderWidth = 1
        input.layer.borderColor = UIColor.lightGray.cgColor
        
        view.addSubview(input)
        input.align(.underMatchingLeft, relativeTo: mainTitle, padding: 10, width: input.width, height: input.height)
        
        saveBtn.frame = input.frame
        saveBtn.backgroundColor = .flatGreenColor()
        saveBtn.setTitle("Save", for: .normal)
        saveBtn.setTitleColor(.white, for: .normal)
        saveBtn.addTarget(self, action: #selector(saveUsername), for: .touchUpInside)
        
        view.addSubview(saveBtn)
        saveBtn.align(.underCentered, relativeTo: input, padding: 0, width: saveBtn.width, height: saveBtn.height)
    }
    @objc func saveUsername(){
        if !(input.text?.isEmpty ?? true){
            let imageDataDict:[String: Int] = ["index": titleIndex]

            // post a notification
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateSocialIconTick"), object: nil, userInfo: imageDataDict)
        }
        self.dismiss(animated: true, completion: nil)
    }
}
