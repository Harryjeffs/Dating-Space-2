//
//  prosViewController.swift
//  Dating Space
//
//  Created by Harry Jeffs on 29/9/19.
//  Copyright © 2019 toPick. All rights reserved.
//

import UIKit
import PARTagPicker
import SwiftIcons

class prosOnboardingViewController: UIViewController, PARTagPickerDelegate {
    
    let tagController = PARTagPickerViewController()
    let colors = PARTagColorReference()
    let addButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(onboaringData.name)
        self.navigationController?.navigationBar.isHidden = true
        
        // Do any additional setup after loading the view.
        
        addChild(tagController)
        tagController.view.frame = CGRect(x: 0, y: 64, width: view.bounds.width, height: COLLECTION_VIEW_HEIGHT)
        view.addSubview(tagController.view)
        tagController.didMove(toParent: self)

        // Customize appearance and data.
        tagController.delegate = self
        tagController.placeholderText = "What are some pros of \(onboaringData.name)?"
        tagController.textfieldRegularTextColor = .black
        tagController.allowsNewTags = true
        tagController.visibilityState = .topAndBottom
        
        colors?.highlightedTagBackgroundColor = .flatGreenColor()
        colors?.highlightedTagTextColor = .flatWhiteColor()
        colors?.chosenTagTextColor = .flatWhiteColor()
        colors?.chosenTagBackgroundColor = .flatGreenColor()
        colors?.chosenTagBorderColor = .flatGreenColor()
        colors?.highlightedTagBorderColor = .flatGreenColor()
        
        tagController.tagColorRef = colors
        
        tagController.view.anchorInCenter(width: view.bounds.width, height: COLLECTION_VIEW_HEIGHT)
        
        addButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        addButton.roundCorners(corners: .allCorners, radius: addButton.height / 2)
        addButton.backgroundColor = .flatSkyBlueColor()
        addButton.setIcon(icon: .icofont(.arrowRight), color: .white, forState: .normal)
        UIColor.gradientColor(view: addButton, colors: [UIColor(hexString: "#F53803"),UIColor(hexString: "#F5D020")], direction: .leftToRight)
        addButton.addTarget(self, action: #selector(nextPost), for: .touchUpInside)
        addButton.dropShadow()
        addButton.isEnabled = false
        view.addSubview(addButton)
        addButton.anchorInCorner(.bottomRight, xPad: 10, yPad: navigationController?.navigationBar.frame.size.height ?? 100, width: addButton.width, height: addButton.height)
    }
    
    @objc func nextPost(){
        onboaringData.pros = tagController.chosenTags as! [String]
        NotificationCenter.default.post(name: Notification.Name("toNextPage"), object: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func chosenTagsWereUpdated(inTagPicker tagPicker: PARTagPickerViewController!) {
        if tagPicker.chosenTags?.count ?? 0 > 0{
            addButton.isEnabled = true
        }else{
            addButton.isEnabled = false
        }
    }
    func tagPicker(_ tagPicker: PARTagPickerViewController!, visibilityChangedTo state: PARTagPickerVisibilityState){
           var newHeight: CGFloat = 0
           if state == .topAndBottom {
               newHeight = 2 * COLLECTION_VIEW_HEIGHT
           } else if state == .topOnly {
               newHeight = COLLECTION_VIEW_HEIGHT
           }

           var frame = tagPicker.view.frame
           frame.size.height = newHeight

           UIView.animate(withDuration: 0.3) {
               tagPicker.view.frame = frame
           }
       }
}
