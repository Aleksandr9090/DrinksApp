//
//  ViewController.swift
//  DrinksApp
//
//  Created by Aleksandr on 18.10.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var drink: Drink!
    private var spinnerView = UIActivityIndicatorView()

    @IBOutlet var drinkImageView: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = drink.strDrink
        showSpinner(in: view)
        descriptionLabel.text = drink.strInstructions
        
        NetworkManager.shared.fetchImage(from: drink.strDrinkThumb) { imageData in
            self.drinkImageView.image = UIImage(data: imageData)
            self.spinnerView.stopAnimating()
        }
    }
    
    private func showSpinner(in view: UIView) {
        spinnerView = UIActivityIndicatorView(style: .large)
        spinnerView.color = .black
        spinnerView.startAnimating()
        spinnerView.center = drinkImageView.center
        spinnerView.hidesWhenStopped = true
        
        view.addSubview(spinnerView)
    }

}

