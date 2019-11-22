//
//  tisprCell.swift
//  Dating Space
//
//  Created by Harry Jeffs on 24/9/19.
//  Copyright © 2019 toPick. All rights reserved.
//

import UIKit
import VerticalCardSwiper
import CyaneaOctopus
import SkeletonView
import ImageSlideshow
import Neon
class ExampleCardCell: CardCell {
    
    let imageSlideShow = ImageSlideshow()
    let name = PaddingLabel()
   /**
     We use this function to calculate and set a random backgroundcolor.
     */
    public func setRandomBackgroundColor() {
        self.backgroundColor = UIColor.randomFlatColor()
        
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        
        self.layer.cornerRadius = 12
        super.layoutSubviews()
    }
    
    func drawLayout(loading: Bool){
        imageSlideShow.frame = CGRect(x: 0, y: 0, width: self.width, height: self.height * 0.3)
        imageSlideShow.isSkeletonable = true
        //imageSlideShow.contentScaleMode = .scaleAspectFill
        imageSlideShow.backgroundColor = .flatRedColor()
        imageSlideShow.roundCorners(corners: [.topLeft, .topRight], radius: 10)
        imageSlideShow.layer.masksToBounds = true
        
        name.frame = CGRect(x: 0, y: 0, width: self.width * 0.3, height: 50)
        name.adjustsFontSizeToFitWidth = true
        name.numberOfLines = 1
        name.font = UIFont(name: title_font, size: title_size)
        
        
        addSubview(imageSlideShow)
        imageSlideShow.anchorToEdge(.top, padding: 0, width: imageSlideShow.width, height: imageSlideShow.height)
        addSubview(name)
        name.align(.underMatchingLeft, relativeTo: imageSlideShow, padding: 0, width: name.width, height: name.height)
    }
}
