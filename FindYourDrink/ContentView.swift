//
//  ContentView.swift
//  FindYourDrink
//
//  Created by Dishant  patel on 11/5/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            DrinksMainView()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
