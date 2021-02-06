//
//  ContentView.swift
//  Allergy
//
//  Created by Rhea Macbook on 2/6/21.
//

import SwiftUI
import Camera_SwiftUI
import CameraView
import AVFoundation

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination:
                            // CameraView()
                            CameraPreview(session: AVCaptureSession())
                                .navigationBarTitle("Take Ingredient List Photo", displayMode: .inline)
                                // .frame(height: 600)
            ) {
                Text("Take Ingredient List Photo!")
                    .padding()
            }
            .navigationBarTitle("Enter Allergies")
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
