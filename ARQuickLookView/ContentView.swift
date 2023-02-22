//
//  ContentView.swift
//  ARQuickLookView
//
//  Created by Mladen Mikic on 20.02.2023.
//

import SwiftUI
import RealityKit


struct ContentView: View {
    
    @State var isPresented = false
    
    // NOTE: Ignore LayoutConstraints issue in the console for demo purpose.
    var body: some View {
        if self.isPresented {
            ARQuickLookView(quicklookVM: .init(doneAction: {
                self.isPresented = false
            }))
        } else {
            Button("Present Demo AR USDZ model.") {
                isPresented = true
            }
        }
    }
}
