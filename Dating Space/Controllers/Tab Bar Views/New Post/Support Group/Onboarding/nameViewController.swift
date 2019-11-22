//
//  nameViewController.swift
//  Dating Space
//
//  Created by Harry Jeffs on 27/9/19.
//  Copyright © 2019 toPick. All rights reserved.
//

import UIKit
import TextFieldEffects
import Neon
import SwiftIcons

class nameViewController: UIViewController {

    let textField = HoshiTextField()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ff")
        self.navigationController?.navigationBar.isHidden = true
        
        textField.frame = CGRect(x: 0, y: 0, width: view.width * 0.9, height: 70)
        textField.placeholder = "Name"
        textField.placeholderFontScale = 2.0
        textField.bounds = CGRect(x: 0, y: 0, width: view.width * 0.9, height: 70)
        textField.isUserInteractionEnabled = true
        //textField.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(toNext)))
        textField.borderActiveColor = .flatSkyBlueColor()
        textField.borderInactiveColor = .black
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

        textField.textColor = .flatBlackColor()
        
        view.addSubview(textField)
        textField.anchorInCenter(width: textField.width, height: textField.height)
        
        let alert = UILabel(frame: CGRect(x: 0, y: 0, width: view.width *  0.9, height: 40))
        alert.text = "Please note that your friend must approve the post before it can be made public."
        alert.numberOfLines = 0
        alert.adjustsFontSizeToFitWidth = true
        alert.textColor = .black
        view.addSubview(alert)
        alert.align(.underCentered, relativeTo: textField, padding: 10, width: alert.width, height: alert.height)
        
        button.frame = CGRect(x: 0, y: 0, width: view.width * 0.6, height: 50)
        button.setTitle("Next", for: .normal)
        button.backgroundColor = .flatSkyBlueColor()
        button.roundCorners(corners: [.allCorners], radius: 10)
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(toNe), for: .touchUpInside)
        button.isEnabled = false
        view.addSubview(button)
        button.align(.underCentered, relativeTo: alert, padding: 10, width: button.width, height: button.height)
    }
    
    @objc func textFieldDidChange(_ textfield: UITextField) {
        if let text = textfield.text{
            print(text)
            if !text.isEmpty{
                button.isEnabled = true
            }else{
                button.isEnabled = false
            }
        }
    }
    @objc func toNe(){
        if let text = textField.text{
            onboaringData.name = text
            NotificationCenter.default.post(name: Notification.Name("toNextPage"), object: nil)
        }
    }
}
extension UIViewController{
    func setUpBackButton(){
        
    }
}
