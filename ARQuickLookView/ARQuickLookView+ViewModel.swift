//
//  ARQuickLookView+ViewModel.swift
//  ARQuickLookView
//
//  Created by Mladen Mikic on 20.02.2023.
//

import Foundation


extension ARQuickLookView {
    
    class ViewModel: ObservableObject {
    
        let fileURL: URL
        var doneAction: () -> ()
        // MARK: - Init.
        
        /// Checkes if the file exists.
        init?(fileURL: URL, doneAction: @escaping () -> ()) {
            self.fileURL = fileURL
            self.doneAction = doneAction
            guard FileManager.default.fileExists(atPath: fileURL.path) else { return nil }
        }
        
        init() {
            guard let path = Bundle.main.path(forResource: "Apple_Free_USDZ", ofType: "usdz") else { fatalError("Couldn't find the supported input file.") }
            let url = URL(fileURLWithPath: path)
            self.fileURL = url
            self.doneAction = {}
        }
        
        init(doneAction: @escaping () -> ()) {
            guard let path = Bundle.main.path(forResource: "Apple_Free_USDZ", ofType: "usdz") else { fatalError("Couldn't find the supported input file.") }
            let url = URL(fileURLWithPath: path)
            self.fileURL = url
            self.doneAction = doneAction
        }
    }
    
}
