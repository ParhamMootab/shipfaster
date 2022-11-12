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
    @Binding var isAniamationShowing: Bool


    func makeUIViewController(context: Context) -> MapViewController {
      return MapViewController()
    }

    func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
      selectedShipment?.vehicles.forEach {
          $0.setMap(mapView: uiViewController.mapView)
          $0.addMarkers()
          $0.drawRouteOnMap()
      }
        if isAniamationShowing {
            startAnimation()
        } 
  }
    
    func startAnimation() {
        selectedShipment?.vehicles.forEach {
            $0.startAnimationTimer()
        }
    }
    
    func resetAnimation() {
        selectedShipment?.vehicles.forEach {
            $0.resetAnimation()
        }
    }
    
    
}
