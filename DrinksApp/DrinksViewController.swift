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
        
        tableView.rowHeight = 100
        fetchDrinks()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        drinks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        NetworkManager.shared.fetchImage(from: "https://images.dog.ceo/breeds/boxer/n02108089_485.jpg") { imageData in
            content.image = UIImage(data: imageData)
            self.tableView.reloadData()
        }
        content.text = drinks[indexPath.row].strDrink
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        cell.contentConfiguration = content
        

        return cell
    }
    
     private func fetchDrinks() {
        guard let url = URL(string: Link.drinksURL.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let aboutDrinks = try JSONDecoder().decode(AboutDrinks.self, from: data)
                self.drinks = aboutDrinks.drinks
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        detailVC.drink = drinks[indexPath.row]
        
    }
    

}
