//
//  ARQuickLookView.swift
//  ARQuickLookView
//
//  Created by Mladen Mikic on 20.02.2023.
//

import UIKit
import QuickLook
import ARKit
import SwiftUI


// Source: https://sarunw.com/posts/uiviewcontroller-in-swiftui/
struct ARQuickLookView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = ARQuickLookViewController
    
    @ObservedObject var quicklookVM: Self.ViewModel
    
    func makeUIViewController(context: Context) -> ARQuickLookViewController {
        return ARQuickLookViewController(quickLookVM: quicklookVM)
    }
    
    func updateUIViewController(_ uiViewController: ARQuickLookViewController, context: Context) {}

}
