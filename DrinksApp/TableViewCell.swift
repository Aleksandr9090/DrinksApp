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
            drinkImageView.layer.cornerRadius = 20
            drinkImageView.backgroundColor = .white
        }
    }
    @IBOutlet var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(with drink: Drink?) {
        nameLabel.text = drink?.strDrink
        NetworkManager.shared.fetchImage(from: drink?.strDrinkThumb) { imageData in
            self.drinkImageView.image = UIImage(data: imageData)
        }
    }
    
    
    
    
}
