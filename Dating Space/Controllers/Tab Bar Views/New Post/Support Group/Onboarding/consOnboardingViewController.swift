//
//  consOnboardingViewController.swift
//  Dating Space
//
//  Created by Harry Jeffs on 29/9/19.
//  Copyright © 2019 toPick. All rights reserved.
//

import UIKit
import PARTagPicker

class consOnboardingViewController: UIViewController, PARTagPickerDelegate {

    let tagController = PARTagPickerViewController()
    let colors = PARTagColorReference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        // Do any additional setup after loading the view.
        
        addChild(tagController)
        tagController.view.frame = CGRect(x: 0, y: 64, width: view.bounds.width, height: COLLECTION_VIEW_HEIGHT)
        view.addSubview(tagController.view)
        tagController.didMove(toParent: self)

        // Customize appearance and data.
        tagController.delegate = self
        tagController.placeholderText = "What are some cons of \(onboaringData.name)?"
        tagController.textfieldRegularTextColor = .black
        tagController.allowsNewTags = true
        tagController.visibilityState = .topAndBottom
        
        colors?.highlightedTagBackgroundColor = .flatRedColor()
        colors?.highlightedTagTextColor = .flatWhiteColor()
        colors?.chosenTagTextColor = .flatWhiteColor()
        colors?.chosenTagBackgroundColor = .flatRedColor()
        colors?.chosenTagBorderColor = .flatRedColor()
        colors?.highlightedTagBorderColor = .flatRedColor()
        colors?.defaultTagTextColor = .black
        
        tagController.tagColorRef = colors
        tagController.view.anchorInCenter(width: view.bounds.width, height: COLLECTION_VIEW_HEIGHT)
    }
    
    func tagPicker(_ tagPicker: PARTagPickerViewController!, visibilityChangedTo state: PARTagPickerVisibilityState) {
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
