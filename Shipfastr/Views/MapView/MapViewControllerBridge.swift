//
//  MapViewControllerBrigde.swift
//  Shipfstr
//
//  Created by Mohammad Esmaeilirad  on 2022-11-06.
//

import GoogleMaps
import SwiftUI

struct MapViewControllerBridge: UIViewControllerRepresentable {

  @Binding var markers: [GMSMarker]
  @Binding var selectedMarker: GMSMarker?
  var onAnimationEnded: () -> ()
  var mapViewWillMove: (Bool) -> ()

  func makeUIViewController(context: Context) -> MapViewController {
//    let uiViewController = MapViewController()
//    uiViewController.mapView.delegate = context.coordinator
    return MapViewController()
  }

  func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
    markers.forEach { $0.map = uiViewController.mapView }
    selectedMarker?.map = uiViewController.mapView
    animateToSelectedMarker(viewController: uiViewController)
  }

  func makeCoordinator() -> MapViewCoordinator {
    return MapViewCoordinator(self)
  }

  private func animateToSelectedMarker(viewController: MapViewController) {
    guard let selectedMarker = selectedMarker else {
      return
    }

    let map = viewController.mapView
      if map?.selectedMarker != selectedMarker {
          map!.selectedMarker = selectedMarker
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
          map?.animate(toZoom: kGMSMinZoomLevel)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            map!.animate(with: GMSCameraUpdate.setTarget(selectedMarker.position))
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
              map?.animate(toZoom: 12)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
              onAnimationEnded()
            })
          })
        }
      }
    }
  }

  final class MapViewCoordinator: NSObject, GMSMapViewDelegate {
    var mapViewControllerBridge: MapViewControllerBridge

    init(_ mapViewControllerBridge: MapViewControllerBridge) {
      self.mapViewControllerBridge = mapViewControllerBridge
    }

    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
      self.mapViewControllerBridge.mapViewWillMove(gesture)
    }
  }
}
