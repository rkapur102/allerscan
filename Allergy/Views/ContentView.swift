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
    @State var allergies: String = ""
    var languageSelection: Int
    
    var body: some View {
            VStack() {
                Spacer()
                Image(uiImage: UIImage(named: "allerscan")!)
                    .resizable()
                    .frame(height:200)
                    .padding(.horizontal, 20)
                
                Spacer()
                
                TextField("Enter allergies here: (i.e. Eggs, Fish, Milk...)", text: $allergies).font(.system(.title2, design: .serif)).lineLimit(2).padding(20)
                let array = allergies.components(separatedBy: ", ")
                Spacer()
                Text("Your allergies: ").font(.system(.title2, design: .serif))
                List(array, id: \.self) { string in
                    Text(string).font(.system(.title2, design: .serif))
                }
                
                Spacer()
                
                NavigationLink(destination:
                                CameraView(allergiesArray: array).environmentObject(CameraViewModel())
                                // CameraPreview(session: AVCaptureSession())
                                    .navigationBarTitle("Take Ingredient List Photo", displayMode: .inline)
                                    .accentColor(Color(.systemGreen))
                                    // .frame(height: 600)
                ) {
                    HStack {
                        Text("Take Ingredient List Photo!")
                            .fontWeight(.bold)
                            .font(.headline)
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
                // .padding(.bottom, 40)
                Spacer()
            }
            .navigationBarTitle("Enter Allergens", displayMode: .inline)
            // .navigationBarHidden(true)
            .accentColor(Color(.systemGreen))
            .padding()
    }
}

struct ArrowShape: SwiftUI.Shape {
    func path(in rect: CGRect) -> SwiftUI.Path {
        var path = Path()

        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.size.width, y: rect.size.height/2.0))
        path.addLine(to: CGPoint(x: 0, y: rect.size.height))

        return path
    }
}

struct Arrows: View {
    private let arrowCount = 3

    @State var fade: Double = 0.5

    var body: some View {
        HStack {
            ForEach(0..<self.arrowCount) { i in
                ArrowShape()
                    .stroke(style: StrokeStyle(lineWidth: CGFloat(3),
                                              lineCap: .round,
                                              lineJoin: .round))
                    .foregroundColor(Color.white)
                    .aspectRatio(CGSize(width: 28, height: 70), contentMode: .fit)
                    .frame(maxWidth: 5)
                    .animation(nil)
                    .opacity(self.fade)
                    .animation(
                        Animation.easeOut(duration: 0.8)
                        .repeatForever(autoreverses: true)
                        .delay(0.2 * Double(i))
                    )
            }
        }
        .frame(width: 30, height: 10)
        .onAppear() {
            self.fade = 1.0
        }
    }
}

