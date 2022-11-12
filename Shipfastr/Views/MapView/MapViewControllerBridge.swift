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
    var timer = Timer()
//    private lazy var timer = Timer()
//    var i: UInt


    func makeUIViewController(context: Context) -> MapViewController {
    // Replace this line
      return MapViewController()
    }

    func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
      selectedShipment?.vehicles.forEach {
          $0.setMap(mapView: uiViewController.mapView)
          $0.addMarkers()
          $0.drawRouteOnMap()
          $0.startAnimationTimer()
      }
  }
    
}
