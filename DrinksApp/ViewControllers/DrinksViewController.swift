//
//  DrinksViewController.swift
//  DrinksApp
//
//  Created by Aleksandr on 18.10.2022.
//

import UIKit

class DrinksViewController: UITableViewController {
    
    private var drinks: [Drink] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchDrinks()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        drinks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let drink = drinks[indexPath.row]
        cell.configure(with: drink)
    
        return cell
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        detailVC.drink = drinks[indexPath.row]
    }
    
    // MARK: - Networking
    
    private func fetchDrinks() {
        NetworkManager.shared.fetch(dataType: AboutDrinks.self, from: Link.drinksURL.rawValue) { result in
            switch result {
            case .success(let aboutDrink):
                self.drinks = aboutDrink.drinks
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
