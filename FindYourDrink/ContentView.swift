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
            Text("Hello World")
        }
        .onAppear {
            Network.sharedInstance.getRandomDrinks { results in
                switch results {
                case .success(let drinks):
                    print(drinks)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
