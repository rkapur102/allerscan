//
//  ContentView.swift
//  Allergy
//
//  Created by Rhea Macbook on 2/6/21.
//

import SwiftUI

struct ContentView: View {
    @State var allergies: String = ""
    @State private var selection = 1

    var body: some View {
        NavigationView {
            ScrollView {
            VStack() {
                Text("Welcome! Please choose your language and enter your allergies. ")
                Picker(selection: $selection, label: Text("Languages:")) {
                                Text("English").tag(1)
                                Text("Spanish").tag(2)
                                Text("French").tag(3)
                            }
                TextField("Enter allergies here (i.e. Eggs, Fish, Milk...)", text: $allergies)
                let array = allergies.components(separatedBy: ", ")
                Text("Your allergies: ")
                List(array, id: \.self) { string in
                    Text(string)
                }
            }
            .padding()
        }
        }
     /*   NavigationLink(*destination: CameraView()) {
            Text("Take Ingredient List Photo!")
            .padding()
        }*/
    }


    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

}
