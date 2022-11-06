//
//  DrinkDetailView.swift
//  FindYourDrink
//
//  Created by Dishant  patel on 11/5/22.
//

import SwiftUI

struct DrinkDetailView: View {
    let imageURL: URL?
    let drinkName: String
    let drinkType: String
    let drinkInstructions: String
    
    init(imageURLString: String, drinkName: String, drinkType: String, drinkInstructions: String) {
        self.imageURL = URL(string: imageURLString)
        self.drinkName = drinkName
        self.drinkType = drinkType
        self.drinkInstructions = drinkInstructions
    }
    
    var body: some View {
        VStack(alignment: .center) {
            AsyncImage(url: imageURL) { image in
                image.resizable()
                    .frame(width: 250, height: 250)
            } placeholder: {
                Image(systemName: "cup.and.saucer.fill")
                    .resizable()
                    .frame(width:60, height: 60)
                    .clipShape(Circle())
            }
            Text("Type of Drink: \(drinkType)")
                .font(.title2)
            VStack(alignment: .leading) {
                Text("Instructions:")
                    .font(.headline)
            }
            Text(drinkInstructions)
        }
        .navigationTitle(drinkName)
        .navigationBarTitleDisplayMode(.large)
    }
}
