//
//  TranslateMaybe.swift
//  Allergy
//
//  Created by Olivia Taylor on 2/6/21.
//

import Foundation

func translate(input: String, language: String) -> String {
    SwiftGoogleTranslate.shared.start(with: "AIzaSyB1KWTxTdi0B-NGrJpeG6pCPD3yjx24pJY")
    var inputVal = "";
    SwiftGoogleTranslate.shared.translate("Hello!", "es", "en") { (text, error) in
      if let t = text {
        inputVal = t;
        print(t)
      } else {
        print("hey")
      }
    }
    return inputVal
}
