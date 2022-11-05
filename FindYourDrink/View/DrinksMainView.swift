//
//  DrinksMainView.swift
//  FindYourDrink
//
//  Created by Dishant  patel on 11/5/22.
//

import SwiftUI

struct DrinksMainView: View {
    
    @ObservedObject var model: DrinksMainViewModel = DrinksMainViewModel()
    
    init() {
        model.getRandomDrinks()
    }
    
    var body: some View {
        if model.drinks.count != 0 {
            List {
                ForEach(model.drinks, id: \.self) { drink in
                    Text(drink.strDrink)
                }
            }
        }
        
    }
    
}

struct DrinksMainView_Previews: PreviewProvider {
    static var previews: some View {
        DrinksMainView()
    }
}
