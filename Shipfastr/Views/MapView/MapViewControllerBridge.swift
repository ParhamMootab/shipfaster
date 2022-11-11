//
//  MapViewControllerBrigde.swift
//  Shipfstr
//
//  Created by Mohammad Esmaeilirad  on 2022-11-06.
//


import GoogleMaps
import SwiftUI

struct MapViewControllerBridge: UIViewControllerRepresentable {
    
  @Binding var selectedShipment: Shipment?

  func makeUIViewController(context: Context) -> MapViewController {
    // Replace this line
      return MapViewController()
  }

  func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
      selectedShipment?.vehicles.forEach {
          $0.addMarkers(uiViewController: uiViewController)
          $0.drawRouteOnMap(uiViewController: uiViewController)
      }
  }
    
//    func startCarAnimation(
    
    
    
}
