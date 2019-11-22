//
//  tisprDatasource.swift
//  Dating Space
//
//  Created by Harry Jeffs on 24/9/19.
//  Copyright © 2019 toPick. All rights reserved.
//

import Foundation
import VerticalCardSwiper
import CyaneaOctopus

extension homeViewController : VerticalCardSwiperDatasource {
    func cardForItemAt(verticalCardSwiperView: VerticalCardSwiperView, cardForItemAt index: Int) -> CardCell {
        if let cardCell = verticalCardSwiperView.dequeueReusableCell(withReuseIdentifier: "ExampleCell", for: index) as? ExampleCardCell {
            cardCell.setRandomBackgroundColor()
            cardCell.drawLayout(loading: false)
            return cardCell
        }
        return CardCell()
    }
    
    func numberOfCards(verticalCardSwiperView: VerticalCardSwiperView) -> Int {
        print("number of cards")
        return 100
    }
}
