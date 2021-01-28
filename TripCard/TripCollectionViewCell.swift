//
//  TripCollectionViewCell.swift
//  TripCard
//
//  Created by Oleg Koptev on 28.01.2021.
//

import UIKit

class TripCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var totalDaysLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
    var delegate: TripCollectionCellDelegate?
    
    @IBAction func likeButtonPressed(sender: AnyObject) {
        delegate?.didLikeButtonPressed(cell: self)
    }
    
    var isLiked: Bool = false {
        didSet {
            likeButton.setImage(UIImage(systemName: isLiked ? "heart.fill" : "heart"), for: .normal)
        }
    }
}

protocol TripCollectionCellDelegate {
    func didLikeButtonPressed(cell: TripCollectionViewCell)
}
