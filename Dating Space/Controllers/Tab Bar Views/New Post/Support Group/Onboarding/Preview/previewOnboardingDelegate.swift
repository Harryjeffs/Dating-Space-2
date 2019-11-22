//
//  previewOnboarding.swift
//  Dating Space
//
//  Created by Harry Jeffs on 10/11/19.
//  Copyright © 2019 toPick. All rights reserved.
//

import Foundation
import VerticalCardSwiper

extension previewOnboardingViewController: VerticalCardSwiperDelegate {
    func sizeForItem(verticalCardSwiperView: VerticalCardSwiperView, index: Int) -> CGSize {
    
        // Allows you to return custom card sizes (optional).
        return CGSize(width: verticalCardSwiperView.frame.width * 0.90, height: verticalCardSwiperView.frame.height * 0.90)
    }
}
