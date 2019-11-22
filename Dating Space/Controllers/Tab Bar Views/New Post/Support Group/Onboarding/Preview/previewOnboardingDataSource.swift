//
//  previewOnboardingDataSource.swift
//  Dating Space
//
//  Created by Harry Jeffs on 9/11/19.
//  Copyright © 2019 toPick. All rights reserved.
//

import Foundation
import VerticalCardSwiper
import ImageSlideshow

extension previewOnboardingViewController : VerticalCardSwiperDatasource {
    func cardForItemAt(verticalCardSwiperView: VerticalCardSwiperView, cardForItemAt index: Int) -> CardCell {
        if let cardCell = verticalCardSwiperView.dequeueReusableCell(withReuseIdentifier: "ExampleCell", for: index) as? ExampleCardCell {
            cardCell.setRandomBackgroundColor()
            //cardCell.imageSlideShow.images = [InputSour]
            cardCell.drawLayout(loading: false)
            
            var imageSlideShowImages = [ImageSource]()
            
            for convertedImages in onboaringData.photos{
                let blurring = BlurImageView(frame: cardCell.imageSlideShow.frame)
                blurring.image = convertedImages
                imageSlideShowImages.append(ImageSource(image: blurring.image!))
            }
            
            cardCell.imageSlideShow.setImageInputs(imageSlideShowImages)
            cardCell.name.text = onboaringData.name
            
            return cardCell
        }
        return CardCell()
    }
    
    func numberOfCards(verticalCardSwiperView: VerticalCardSwiperView) -> Int {
        print("number of cards")
        return 1
    }
}
