//
//  mapStyling.swift
//  Shipfastr
//
//  Created by Mohammad Esmaeilirad  on 2022-11-12.
//

import Foundation
import GoogleMaps


class MapStyling {
    var mapStyle: String?
    private var mapView: GMSMapView?
    
    
    init (mapStyle: String?) {
        self.mapStyle = mapStyle
        self.mapView = nil
    }
    
    func setMap (mapView: GMSMapView) {
        self.mapView = mapView
    }
    
    
    func setMapStyling() {
        do {
          // Set the map style by passing the URL of the local file.
          if let styleURL = Bundle.main.url(forResource: mapStyle, withExtension: "json") {
              mapView?.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
          } else {
            NSLog("Unable to find style.json")
          }
        } catch {
          NSLog("One or more of the map styles failed to load. \(error)")
        }
    }
}
