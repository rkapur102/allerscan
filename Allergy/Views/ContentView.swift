//
//  ContentView.swift
//  Allergy
//
//  Created by Rhea Macbook on 2/6/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: CameraView()) {
                Text("Take Ingredient List Photo!")
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
