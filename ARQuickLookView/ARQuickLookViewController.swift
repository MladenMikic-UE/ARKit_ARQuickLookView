//
//  ARQuickLookViewController.swift
//  ARQuickLookView
//
//  Created by Mladen Mikic on 20.02.2023.
//

import UIKit
import QuickLook
import ARKit


// Docu: https://developer.apple.com/documentation/quicklook/qlpreviewcontroller
class ARQuickLookViewController: UIViewController, QLPreviewControllerDataSource, QLPreviewControllerDelegate {
    
    private(set) var quickLookVM: ARQuickLookView.ViewModel
    
    // MARK: - Init.
    
    init(quickLookVM: ARQuickLookView.ViewModel) {
        self.quickLookVM = quickLookVM
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - VC Lifecycle.
    
    override func viewDidAppear(_ animated: Bool) {
        let previewController = QLPreviewController()
        previewController.dataSource = self
        previewController.delegate = self
        present(previewController, animated: true, completion: nil)
    }
    
    // MARK: - QLPreviewControllerDataSource.
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int { return 1 }

    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        return self.quickLookVM.fileURL as QLPreviewItem
    }
    
    // MARK: - QLPreviewControllerDelegate.
    
    func previewControllerWillDismiss(_ controller: QLPreviewController) {
        self.quickLookVM.doneAction()
    }
}
