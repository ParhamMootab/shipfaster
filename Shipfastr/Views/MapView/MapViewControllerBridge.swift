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
    @Binding var isShipmentShowing: Bool

    func makeUIViewController(context: Context) -> MapViewController {
      return MapViewController()
    }

    func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
        if isShipmentShowing {
            selectedShipment?.vehicles.forEach {
                $0.setMap(mapView: uiViewController.mapView)
                $0.addMarkers()
                $0.drawRouteOnMap()
            }
        }
    }
    
}
