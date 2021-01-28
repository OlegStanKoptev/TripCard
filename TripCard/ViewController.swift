//
//  ViewController.swift
//  TripCard
//
//  Created by Oleg Koptev on 28.01.2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, TripCollectionCellDelegate {
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var wallpaper: UIImageView!
    
    private var trips = [
        Trip(tripId: "Paris001", city: "Paris", country: "France", featuredImage: UIImage(named: "paris"), price: 2000, totalDays: 5, isLiked: false),
        Trip(tripId: "Rome001", city: "Rome", country: "Italy", featuredImage: UIImage(named: "rome"), price: 800, totalDays: 3, isLiked: false),
        Trip(tripId: "Istanbul001", city: "Istanbul", country: "Turkey", featuredImage: UIImage(named: "istanbul"), price: 2200, totalDays: 10, isLiked: false)
    ]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trips.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TripCollectionViewCell
        
        cell.cityLabel.text = trips[indexPath.row].city
        cell.countryLabel.text = trips[indexPath.row].country
        cell.imageView.image = trips[indexPath.row].featuredImage
        cell.priceLabel.text = "$\(String(trips[indexPath.row].price))"
        cell.totalDaysLabel.text = "\(trips[indexPath.row].totalDays) days"
        cell.isLiked = trips[indexPath.row].isLiked
        cell.layer.cornerRadius = 4.0
        cell.delegate = self
        cell.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 1 / 2).isActive = true
        cell.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 5 / 16).isActive = true
        
        if (cell.imageView.layer.sublayers == nil) {
            let collectionCoverLayer = CALayer()
            collectionCoverLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.height * 5 / 16, height: UIScreen.main.bounds.height * 1 / 2);
            collectionCoverLayer.backgroundColor = UIColor.black.cgColor
            collectionCoverLayer.opacity = 0.5
            cell.imageView.layer.addSublayer(collectionCoverLayer)
        }
        
        return cell
    }
    
    func didLikeButtonPressed(cell: TripCollectionViewCell) {
        if let indexPath = collectionView.indexPath(for: cell) {
            trips[indexPath.row].isLiked.toggle()
            cell.isLiked.toggle()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let wallpaperCoverLayer = CALayer()
        wallpaperCoverLayer.frame = UIScreen.main.bounds
        wallpaperCoverLayer.backgroundColor = UIColor.black.cgColor
        wallpaperCoverLayer.opacity = 0.1
        wallpaper.layer.addSublayer(wallpaperCoverLayer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.clear
    }
    
}
