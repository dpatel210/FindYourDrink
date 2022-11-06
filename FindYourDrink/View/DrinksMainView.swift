//
//  DrinksMainView.swift
//  FindYourDrink
//
//  Created by Dishant  patel on 11/5/22.
//

import SwiftUI

struct DrinksMainView: View {
    
    @ObservedObject var model: DrinksMainViewModel = DrinksMainViewModel()
    
    @State var drinkToSearch: String = ""
    
    init() {
        model.getRandomDrinks()
    }
    
    var body: some View {
        if model.drinks.count != 0 {
            List {
                HStack {
                    Spacer()
                    TextField("Search for a Drink", text: $drinkToSearch)
                    Spacer()
                }
                ForEach(model.drinks, id: \.self) { drink in
                    NavigationLink {
                        DrinkDetailView(imageURLString: drink.strDrinkThumb ?? "", drinkName: drink.strDrink ?? "", drinkType: drink.strAlcoholic ?? "", drinkInstructions: drink.strInstructions ?? "")
                    } label: {
                        DrinksCardView(urlImageStr: drink.strDrinkThumb ?? "", drinkName: drink.strDrink ?? "", drinkType: drink.strAlcoholic ?? "")
                            .background(.clear)
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Search") {
                        model.searchForDrink(drink: drinkToSearch)
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
