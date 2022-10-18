//
//  NetworkManager.swift
//  DrinksApp
//
//  Created by Aleksandr on 18.10.2022.
//

import Foundation
class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
     func fetchImage(from url: String?, with completion: @escaping(Data) -> Void) {
        guard let stringURL = url else { return }
        guard let imageURL = URL(string: stringURL) else { return }
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: imageURL) else { return }
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }
    
}
