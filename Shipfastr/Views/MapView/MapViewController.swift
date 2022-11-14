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
       self.view = mapView
       let marker = GMSMarker()
       marker.position = CLLocationCoordinate2D(latitude: 49.28273, longitude: -123.120735)
       marker.title = "Vancouver"
       marker.snippet = "Canada"
       marker.map = mapView

       print(GMSServices.openSourceLicenseInfo())}
    

}
