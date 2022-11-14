//
//  PlaceAutocompleteViewControllerBridge.swift
//  Shipfastr
//
//  Created by Mohammad Esmaeilirad  on 2022-11-14.
//

import SwiftUI

struct PlaceAutocompleteViewControllerBridge: UIViewControllerRepresentable {
        
    func makeUIViewController(context: Context) -> PlaceAutocompleteViewController {
        return PlaceAutocompleteViewController()
    }
    
    func updateUIViewController(_ placesViewController: PlaceAutocompleteViewController, context: Context) {
           
    }
    
}

