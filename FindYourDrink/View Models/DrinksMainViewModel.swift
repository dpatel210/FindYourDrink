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
        Network.sharedInstance.getRandomDrinks { results in
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
    
}
