//
//  ContentView.swift
//  ERP-TestRechner
//
//  Created by Christian Baltzer on 23.07.20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            //Text("Wähle eine Übung:")
            List{
                Text("Bitte wähle eine Übung")
                NavigationLink(destination: GameScreen1()) { Text("Einstufige Produktionsgrobplanung") }
                        .padding(.vertical, 10.0)
                        .background(Color.green)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
            }
            .navigationTitle("ERP Rechnungen")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
