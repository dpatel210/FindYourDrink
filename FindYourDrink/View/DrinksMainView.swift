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
                    NavigationLink {
                        Text(drink.strDrink ?? "")
                    } label: {
                        DrinksCardView(urlImageStr: drink.strDrinkThumb ?? "", drinkName: drink.strDrink ?? "", drinkType: drink.strAlcoholic ?? "")
                            .background(.clear)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Home")
            .ignoresSafeArea(edges: [.bottom, .horizontal])
        }
        
    }
    
}

struct DrinksMainView_Previews: PreviewProvider {
    static var previews: some View {
        DrinksMainView()
    }
}
