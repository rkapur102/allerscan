//
//  AllergyApp.swift
//  Allergy
//
//  Created by Rhea Macbook on 2/6/21.
//

import SwiftUI
import Firebase

@main
struct AllergyApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            LogoLanguage()
        }
    }
}
 
