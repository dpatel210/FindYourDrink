//
//  Network.swift
//  FindYourDrink
//
//  Created by Dishant  patel on 11/5/22.
//

import Foundation

class Network {
    
    static let sharedInstance = Network()
    
    let session = URLSession(configuration: .default)
    
    func LoadInitialDrinks(completion: @escaping (Result<DrinksList, Error>) -> ()) {
        
        guard let url = Bundle.main.url(forResource: "MockData1", withExtension: "json") else { return }
        
        let dataTask = session.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            
            guard response != nil, let data = data else {
                return
            }
            
            
            
            DispatchQueue.main.async {
                if let drinksObject = try? JSONDecoder().decode(DrinksList.self, from: data) {
                    completion(.success(drinksObject))
                } else {
                    let error = NSError(domain: "", code: 200)
                    completion(.failure(error))
                }
            }
        }
        dataTask.resume()
    }
    
    func searchDrinks(drink: String, completion: @escaping (Result<DrinksList, Error>) -> ()) {
        let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=\(drink)")

        guard let url = url else {
            print("Failure due to bad url")
            return

        }
        
        let dataTask = session.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(error!))
                }
                return
            }
            
            guard response != nil, let data = data else {
                return
            }
            
            
            
            DispatchQueue.main.async {
                if let drinksObject = try? JSONDecoder().decode(DrinksList.self, from: data) {
                    completion(.success(drinksObject))
                } else {
                    let error = NSError(domain: "", code: 200)
                    completion(.failure(error))
                }
            }
        }
        dataTask.resume()
    }
}
