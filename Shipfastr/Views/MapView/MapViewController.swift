//
//  MapViewController.swift
//  Shipfaster
//
//  Created by Mohammad Esmaeilirad  on 2022-11-06.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    
    var mapView: GMSMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GMSServices.provideAPIKey("AIzaSyAljGQx6PV8wK63qHQXjl5FJ3UZDeXta2Y")
        let camera = GMSCameraPosition(latitude: 49.28273, longitude: -123.120735, zoom: 12)
        mapView = GMSMapView(frame: .zero, camera: camera)
        darkThemeStyling()
        self.view = mapView
        
    }
    
    func darkThemeStyling() {
        do {
          // Set the map style by passing the URL of the local file.
          if let styleURL = Bundle.main.url(forResource: "dark-theme", withExtension: "json") {
            mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
          } else {
            NSLog("Unable to find style.json")
          }
        } catch {
          NSLog("One or more of the map styles failed to load. \(error)")
        }
    }

}
