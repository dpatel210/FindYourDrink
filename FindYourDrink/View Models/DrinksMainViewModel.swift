//
//  DrinksMainViewModel.swift
//  FindYourDrink
//
//  Created by Dishant  patel on 11/5/22.
//

import Foundation
import SwiftUI


class DrinksMainViewModel: ObservableObject {
    @Published var drinks: [Drink] = []
    @Published var error: String = ""
    
    
    func getRandomDrinks() {
        Network.sharedInstance.LoadInitialDrinks { results in
            switch results {
            case .success(let drinksList):
                print(drinksList)
                self.drinks = drinksList.drinks
            case .failure(let error):
                print(error)
                self.error = error.localizedDescription
            }
        }
    }
    
    func searchForDrink(drink: String) {
        if drink.isEmpty {
            return
        }
        let fixedDrinkString = drink.replacingOccurrences(of: " ", with: "_")
        Network.sharedInstance.searchDrinks(drink: fixedDrinkString) { result in
            switch result {
            case .success(let drinkList):
                self.drinks = drinkList.drinks
            case .failure(let error):
                self.error = error.localizedDescription
            }
        }
    }
    
}
