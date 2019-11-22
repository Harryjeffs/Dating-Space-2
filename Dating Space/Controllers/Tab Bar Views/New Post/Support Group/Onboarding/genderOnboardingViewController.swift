//
//  genderOnboardingViewController.swift
//  Dating Space
//
//  Created by Harry Jeffs on 29/9/19.
//  Copyright © 2019 toPick. All rights reserved.
//

import UIKit

class genderOnboardingViewController: UIViewController {

    let maleGender = UIView()
    let maleGenderIcon = UIImageView()
    
    let femaleGender = UIView()
    let femaleGenderIcon = UIImageView()
    
    var heightWidth = 100
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        maleGender.frame = CGRect(x: 0, y: 0, width: view.width / 2, height: view.height)
        maleGender.backgroundColor = .flatSkyBlueColor()
        maleGender.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(maleAccept)))
        
        maleGenderIcon.frame = CGRect(x: 0, y: 0, width: heightWidth, height: heightWidth)
        maleGenderIcon.image = .init(icon: .emoji(.genderMale), size: CGSize(width: heightWidth, height: heightWidth), textColor: .white, backgroundColor: .clear)
        maleGenderIcon.center = maleGender.center
        
        femaleGender.frame = CGRect(x: 0, y: 0, width: view.width / 2, height: view.height)
        femaleGender.backgroundColor = .flatPinkColor()
        femaleGender.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(femaleAccept)))
        
        femaleGenderIcon.frame = CGRect(x: 0, y: 0, width: heightWidth, height: heightWidth)
        femaleGenderIcon.image = .init(icon: .emoji(.genderFemale), size: CGSize(width: heightWidth, height: heightWidth), textColor: .white, backgroundColor: .clear)
        femaleGenderIcon.center = femaleGender.center
        
        view.addSubview(maleGender)
        view.addSubview(femaleGender)
        maleGender.addSubview(maleGenderIcon)
        femaleGender.addSubview(femaleGenderIcon)
        
        view.groupAndFill(group: .horizontal, views: [maleGender, femaleGender], padding: 0)
        // Do any additional setup after loading the view.
    }
    
    @objc func maleAccept(){
        onboaringData.gender = .male
        NotificationCenter.default.post(name: Notification.Name("toNextPage"), object: nil)
    }
    
    @objc func femaleAccept(){
        onboaringData.gender = .female
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

}
