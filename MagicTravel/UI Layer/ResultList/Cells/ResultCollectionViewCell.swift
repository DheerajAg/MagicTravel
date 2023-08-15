//
//  ResultCollectionViewCell.swift
//  MagicTravel
//
//  Created by Dheeraj Agarwal on 15/08/23.
//

import UIKit
import SDWebImage

class ResultCollectionViewCell: UICollectionViewCell {

    @IBOutlet private var thumbnailImageView: UIImageView!
    @IBOutlet private var drinkNameLabel: UILabel!
    @IBOutlet private var glassTypeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setup(imageUrl: String, title: String, glass: String) {
        if let url = URL(string: imageUrl) {
            thumbnailImageView.sd_setImage(with: url)
        }
        drinkNameLabel.text = title
        glassTypeLabel.text = glass
    }

}
