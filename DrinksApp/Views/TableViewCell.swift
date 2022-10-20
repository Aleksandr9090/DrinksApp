//
//  TableViewCell.swift
//  DrinksApp
//
//  Created by Aleksandr on 18.10.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var drinkImageView: UIImageView! {
        didSet {
            drinkImageView.contentMode = .scaleAspectFit
            drinkImageView.clipsToBounds = true
            drinkImageView.layer.cornerRadius = drinkImageView.frame.height / 2
            drinkImageView.backgroundColor = .white
        }
    }
    
    @IBOutlet var nameLabel: UILabel!

    func configure(with drink: Drink?) {
        nameLabel.text = drink?.strDrink
        NetworkManager.shared.fetchImage(from: drink?.strDrinkThumb) { imageData in
            self.drinkImageView.image = UIImage(data: imageData)
        }
    }
}
