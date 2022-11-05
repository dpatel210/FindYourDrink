//
//  DrinksCardView.swift
//  FindYourDrink
//
//  Created by Dishant  patel on 11/5/22.
//

import SwiftUI

struct DrinksCardView: View {
    let imageURL: URL?
    let drinkName: String
    let drinkType: String
    
    init(urlImageStr: String, drinkName: String, drinkType: String) {
        self.imageURL = URL(string: urlImageStr)
        self.drinkName = drinkName
        self.drinkType = drinkType
    }
    
    var body: some View {
        HStack {
            AsyncImage(url: imageURL)
        }
    }
}

struct DrinksCardView_Previews: PreviewProvider {
    static var previews: some View {
        DrinksCardView(urlImageStr: "https://www.thecocktaildb.com/images/media/drink/qvuyqw1441208955.jpg", drinkName: "Miami Vice", drinkType: "Alcoholic")
    }
}
