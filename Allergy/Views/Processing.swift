//
//  Processing.swift
//  Allergy
//
//  Created by Rhea Macbook on 2/6/21.
//

import SwiftUI
import UIKit
import Firebase
import Foundation

struct Processing: View {
    @EnvironmentObject var model: CameraViewModel
    @EnvironmentObject var model2: ImageAndText
    @State var toggle = false
    var allergiesArray: [String]
    // var photo: UIImage
    var body: some View {
        VStack {
            Spacer(minLength: 20)
            Image(uiImage: model.photo.image!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 400)
                .animation(.spring())
            Spacer(minLength: 15)
            if toggle == false {
                Text("Processing...").font(.system(.title2, design: .serif)).layoutPriority(2).padding(.horizontal, 15)
            } else {
                afterDetection().layoutPriority(2).padding(.horizontal, 15)
            }
            Spacer()
        }
        .navigationBarTitle("Allergen Detection", displayMode: .inline)
        .onAppear() {
            model2.checkForAllergens(allergies: allergiesArray, ingredientListPhoto: model.photo.image!)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                toggle.toggle()
            }
        }
        // .padding(.horizontal, 10)
    }
    
    @ViewBuilder
    func afterDetection() -> some View {
        if model2.allergens.count == 0 {
            // good
            Text("This food is safe! Enjoy!").font(.system(.title2, design: .serif))
        } else {
            // bad
            VStack {
                Text("Don't eat! This item has ingredients you're allergic to:")
                    .font(.system(.title2, design: .serif)).lineLimit(4)
                List(model2.allergens, id: \.self) { string in
                    Text(string)
                        .font(.system(.title2, design: .serif))
                }
            }
        }
    }
}


