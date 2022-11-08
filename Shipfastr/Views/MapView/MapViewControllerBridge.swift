//
//  MapViewControllerBrigde.swift
//  Shipfstr
//
//  Created by Mohammad Esmaeilirad  on 2022-11-06.
//

import SwiftUI

struct MapViewControllerBridge: UIViewControllerRepresentable {

  func makeUIViewController(context: Context) -> MapViewController {
    return MapViewController()
  }

  func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
  }
}
