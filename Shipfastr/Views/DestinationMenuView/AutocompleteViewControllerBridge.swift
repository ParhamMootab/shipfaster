//
//  AutocompleteViewControllerBridge.swift
//  Shipfastr
//
//  Created by Parham Shagerdmootab on 2022-11-13.
//

import Foundation
import SwiftUI
import GooglePlaces

struct AutocompleteViewControllerBridge: UIViewControllerRepresentable {
    
    
    func makeUIViewController(context: Context) -> AutocompleteController {
      return AutocompleteController()
    }
    func updateUIViewController(_ uiViewController: AutocompleteController, context: Context) {
        
    }

    
    
}
