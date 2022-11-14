//
//  Vehicle.swift
//  Shipfaster
//
//  Created by Mohammad Esmaeilirad  on 2022-11-08.
//

import Foundation
import GoogleMaps
import SwiftUI


class Vehicle  {
    
    private var map: GMSMapView?
    
    let route: String?
    let locations: [CLLocationCoordinate2D]
    
    private lazy var path = GMSPath()
    private lazy var path2 = [String]()
    private lazy var polyline = GMSPolyline()
    private lazy var newPolyline = GMSPolyline()
    private lazy var newPath = GMSMutablePath()
    private lazy var carMarker = GMSMarker()
    
    private lazy var locationManager = CLLocationManager()
    
    private var i: UInt = 0
    private lazy var timer = Timer()
    

    var carView: UIImageView?
    var mapView: UIImageView?

    init (route: String?, locations: [CLLocationCoordinate2D]) {
        self.route = route
        self.locations = locations
        self.map = nil
    }
    
    func setMap (mapView: GMSMapView) {
        self.map = mapView
    }
    
    
    func addMarkers(){
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 40, weight: .bold, scale: .large)
        var mappin = UIImage(systemName: "mappin.and.ellipse", withConfiguration: largeConfig)?.withRenderingMode(.alwaysTemplate)
        var markerView = UIImageView(image: mappin)
        markerView.tintColor = .systemPurple
        mapView = markerView
        
        // different pin for source
        let marker = GMSMarker(position: locations[0])
        marker.iconView = mapView
        marker.title = "See Shipment Overview"
        marker.map = self.map
        
        
        mappin = UIImage(systemName: "mappin", withConfiguration: largeConfig)?.withRenderingMode(.alwaysTemplate)
        markerView = UIImageView(image: mappin)
        markerView.tintColor = .orange
        mapView = markerView
        
        for (id, _) in locations.enumerated() {
            if id > 0 {
                let marker = GMSMarker(position: locations[id])
                marker.iconView = mapView
                marker.map = self.map
            }
            
        }
//        for location in self.locations {
//            let marker = GMSMarker(position: location)
//            marker.map = self.map
//        }
    }
    
    func drawRouteOnMap() {
        guard let route = route else {return}
        guard let path = GMSPath(fromEncodedPath: route) else {return}
        self.path = path

        polyline = GMSPolyline(path: path)
        polyline.strokeColor = UIColor.systemCyan
        polyline.strokeWidth = 2
        polyline.map = self.map

        let largeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold, scale: .large)
        let car = UIImage(systemName: "car.circle.fill", withConfiguration: largeConfig)?.withRenderingMode(.alwaysTemplate)
        let markerView = UIImageView(image: car)
        markerView.tintColor = .white
        carView = markerView
        
//         Move Camera to the location with animation
        let bounds = GMSCoordinateBounds(path: path)
        let insets = UIEdgeInsets(top: 20, left: 60, bottom: 20, right: 60)
        let camera = GMSCameraUpdate.fit(bounds, with: insets)
        self.map?.animate(with: camera)
    }
    
    @objc func animatePolylinePath() {
       //Iterate each valid coordinate on the path

       if i < path.count() {
           carMarker.map = nil
           carMarker = GMSMarker(position: path.coordinate(at: i))
           carMarker.groundAnchor = CGPoint(x: 0.5, y: 0.5)
           carMarker.iconView = carView
           

           newPath.add(path.coordinate(at: i))
           newPolyline.path = newPath
           newPolyline.strokeColor = UIColor.systemBlue
           newPolyline.strokeWidth = 4
           newPolyline.map = self.map
           carMarker.map = self.map

           i += 1
       } else {
           print("Animation Ended!")
       }
   }
    
    
    func resetAnimation() {
        timer.invalidate()
        i = 0
        newPath.removeAllCoordinates()
        map?.clear()
    }
    
     func startAnimationTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(self.animatePolylinePath), userInfo: nil, repeats: true)
    }
     
    
}
