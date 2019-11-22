//
//  tisprDelegate.swift
//  Dating Space
//
//  Created by Harry Jeffs on 24/9/19.
//  Copyright © 2019 toPick. All rights reserved.
//

import Foundation
import VerticalCardSwiper

extension homeViewController: VerticalCardSwiperDelegate {
    func willSwipeCardAway(card: CardCell, index: Int, swipeDirection: SwipeDirection) {
        
        // called right before the card animates off the screen (optional).
    }

    func didSwipeCardAway(card: CardCell, index: Int, swipeDirection: SwipeDirection) {
        print("user has swiped", swipeDirection)
        // handle swipe gestures (optional).
    }
    
    func sizeForItem(verticalCardSwiperView: VerticalCardSwiperView, index: Int) -> CGSize {
    
        // Allows you to return custom card sizes (optional).
        return CGSize(width: verticalCardSwiperView.frame.width * 0.90, height: verticalCardSwiperView.frame.height * 0.90)
    }
    
    func didScroll(verticalCardSwiperView: VerticalCardSwiperView) {
        if lastContentOffset > verticalCardSwiperView.contentOffset.y && lastContentOffset < verticalCardSwiperView.contentSize.height - verticalCardSwiperView.frame.height {
            print("up")
            // move up
        } else if lastContentOffset < verticalCardSwiperView.contentOffset.y && verticalCardSwiperView.contentOffset.y > 0 {
            print("down")
            // move down
        }

        // update the new position acquired
        //lastContentOffset = verticalCardSwiperView.contentOffset.y
        // Tells the delegate when the user scrolls through the cards (optional).
    }
    
    func didEndScroll(verticalCardSwiperView: VerticalCardSwiperView) {
        print("End scrolling")
        if lastContentOffset > verticalCardSwiperView.contentOffset.y && lastContentOffset < verticalCardSwiperView.contentSize.height - verticalCardSwiperView.frame.height {
            print("ended up")
            // move up
        } else if lastContentOffset < verticalCardSwiperView.contentOffset.y && verticalCardSwiperView.contentOffset.y > 0 {
            print("ended down")
            cardSwiper.deleteCards(at: [((cardSwiper.focussedCardIndex ?? 1) - 1)])
            // move down
        }
        lastContentOffset = verticalCardSwiperView.contentOffset.y
    }
    
    func didDragCard(card: CardCell, index: Int, swipeDirection: SwipeDirection) {
        
        // Called when the user starts dragging a card to the side (optional).
    }
    
    func didTapCard(verticalCardSwiperView: VerticalCardSwiperView, index: Int) {
    
        // Tells the delegate when the user taps a card (optional).
    }
    
    func didHoldCard(verticalCardSwiperView: VerticalCardSwiperView, index: Int, state: UIGestureRecognizer.State) {
    
        // Tells the delegate when the user holds a card (optional).
    }
}
