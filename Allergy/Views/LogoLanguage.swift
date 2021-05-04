//
//  LogoLanguage.swift
//  Allergy
//
//  Created by Rhea Macbook on 2/6/21.
//

import SwiftUI

struct LogoLanguage: View {
    @State private var selection = 1
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image(uiImage: UIImage(named: "allerscan")!)
                    .resizable()
                    .padding(.horizontal, 20)
                Spacer(minLength: 20)
                Text("Welcome! Please choose your language:").font(.system(.title2, design: .serif)).lineLimit(2).padding(.horizontal, 20)
                Spacer()
                Picker(selection: $selection, label: Text("Languages:")) {
                    Text("Spanish").font(.system(.title2, design: .serif)).tag(2)
                    Text("French").font(.system(.title2, design: .serif)).tag(3)
                    Text("English").font(.system(.title2, design: .serif)).tag(1)
                    Text("Russian").font(.system(.title2, design: .serif)).tag(4)
                    Text("Arabic").font(.system(.title2, design: .serif)).tag(3)
                }
                Spacer()
                NavigationLink(destination: ContentView(languageSelection: selection)
                                    // .frame(height: 600)
                ) {
                    HStack {
                        Text("Enter Allergies")
                            .fontWeight(.bold)
                            .font(.title2)
                            .foregroundColor(.white)
                        Arrows()
                    }
                        .padding(.vertical, 7)
                        .padding(.horizontal, 15)
                    .background(Color(.systemGreen))
                        .cornerRadius(50)
                    .padding()
                    // Text("Take Ingredient List Photo!")
                        // .padding()
                }
                .navigationBarTitle("Back")
                .navigationBarHidden(true)
                .accentColor(Color(.systemGreen))
                .padding(.bottom, 40)
                Spacer()
            }
        }
        .accentColor(Color(.systemGreen))
    }
}

struct LogoLanguage_Previews: PreviewProvider {
    static var previews: some View {
        LogoLanguage()
    }
}
