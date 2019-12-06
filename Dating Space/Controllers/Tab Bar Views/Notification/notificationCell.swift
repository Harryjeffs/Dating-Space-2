//
//  notificationCell.swift
//  Dating Space
//
//  Created by Harry Jeffs on 6/12/19.
//  Copyright © 2019 toPick. All rights reserved.
//

import UIKit
import Neon
class notificationCell: UITableViewCell {
    
    let mainTitle = UILabel()
    let timeSinceLabel = UILabel()
    let placeholderImage = UIImageView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func drawLayout(){
        placeholderImage.frame = CGRect(x: 0, y: 0, width: width * 0.3, height: width * 0.8)
        addSubview(placeholderImage)
        placeholderImage.anchorToEdge(.left, padding: 0, width: placeholderImage.width, height: placeholderImage.height)
        
        mainTitle.frame = CGRect(x: 0, y: 0, width: width * 0.65, height: width * 0.6)
        mainTitle.textColor = .black
        mainTitle.adjustsFontSizeToFitWidth = true
        mainTitle.numberOfLines = 0
        mainTitle.align(.toTheRightMatchingTop, relativeTo: placeholderImage, padding: 0, width: mainTitle.width, height: mainTitle.height)
        addSubview(mainTitle)
        
        timeSinceLabel.frame = CGRect(x: 0, y: 0, width: width * 0.65, height: width * 0.4)
        timeSinceLabel.textColor = .black
        timeSinceLabel.adjustsFontSizeToFitWidth = true
        timeSinceLabel.numberOfLines = 1
        timeSinceLabel.align(.underMatchingLeft, relativeTo: mainTitle, padding: 0, width: mainTitle.width, height: mainTitle.height)
        addSubview(timeSinceLabel)
    }
}
