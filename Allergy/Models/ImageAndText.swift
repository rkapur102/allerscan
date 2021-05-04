//
//  ImageAndText.swift
//  Allergy
//
//  Created by Rhea Macbook on 2/6/21.
//

import Foundation
import Firebase
import UIKit

public class ImageAndText: ObservableObject {
    @Published var allergens = [String]()
    
    func checkForAllergens(allergies: [String], ingredientListPhoto: UIImage) {
        let vision = Vision.vision()
        let textRecognizer = vision.onDeviceTextRecognizer()

        let image = VisionImage(image: ingredientListPhoto)
        
        textRecognizer.process(image) { result, error in
          guard error == nil, let result = result else {
            // ...
            return
          }
            
            // Recognized text
            let resultText = result.text.lowercased()
            // print(resultText)
            
            print(resultText.contains("wheat"))
            // print("eggs wheat milk".contains("wheat"))
            
            let lowercasedAllergies = allergies.map { $0.lowercased() }
            
            for food in lowercasedAllergies {
                print("." + food + ".")
                if resultText.contains(food) {
                    print("goes in if")
                    self.allergens.append(food)
                }
            }
        }
    }
}


