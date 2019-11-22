//
//  previewOnboardingViewController.swift
//  Dating Space
//
//  Created by Harry Jeffs on 9/11/19.
//  Copyright © 2019 toPick. All rights reserved.
//

import UIKit
import VerticalCardSwiper

class previewOnboardingViewController: UIViewController {

    var cardSwiper = VerticalCardSwiper()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .white
        
        cardSwiper.frame = self.view.bounds
        cardSwiper.isSideSwipingEnabled = false
        cardSwiper.cardSpacing = 20
        cardSwiper.sideInset = 10
        
        view.addSubview(cardSwiper)
            
        cardSwiper.datasource = self
        cardSwiper.delegate = self
        
        cardSwiper.register(ExampleCardCell.self, forCellWithReuseIdentifier: "ExampleCell")
    }
    
    func mergedImageWith(frontImage:UIImage?, backgroundImage: UIImage?) -> UIImage{

        if (backgroundImage == nil) {
            return frontImage!
        }
        
        let size = self.view.frame.size
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)

        backgroundImage?.draw(in: CGRect.init(x: 0, y: 0, width: size.width, height: size.height))
        frontImage?.draw(in: CGRect.init(x: 0, y: 0, width: size.width, height: size.height).insetBy(dx: size.width * 0.2, dy: size.height * 0.2))

        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        return newImage
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
