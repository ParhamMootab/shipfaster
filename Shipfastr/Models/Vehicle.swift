//
//  Vehicle.swift
//  Shipfaster
//
//  Created by Mohammad Esmaeilirad  on 2022-11-08.
//

import Foundation
import GoogleMaps


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
    

    var carView: UIImage?
    
    init (route: String?, locations: [CLLocationCoordinate2D]) {
        self.route = route
        self.locations = locations
        self.map = nil
    }
    
    func setMap (mapView: GMSMapView) {
        self.map = mapView
    }
    
    
    func addMarkers(){
        for location in self.locations {
            let marker = GMSMarker(position: location)
            marker.map = self.map
        }
    }
    
    func drawRouteOnMap() {
        guard let route = route else {return}
        guard let path = GMSPath(fromEncodedPath: route) else {return}
        self.path = path

        polyline = GMSPolyline(path: path)
        polyline.strokeColor = UIColor.gray
        polyline.strokeWidth = 2
        polyline.map = self.map


        let car = UIImage(systemName: "car.top.radiowaves.front")
        let markerView = car
//        markerView.tintColor = .blue
        carView = markerView
        
//         Move Camera to the location with animation
        let bounds = GMSCoordinateBounds(path: path)
        let insets = UIEdgeInsets(top: 20, left: 40, bottom: 20, right: 40)
        let camera = GMSCameraUpdate.fit(bounds, with: insets)
        self.map?.animate(with: camera)
    }
    
    @objc func animatePolylinePath() {
       //Iterate each valid coordinate on the path

       if i < path.count() {
           carMarker.map = nil
           carMarker = GMSMarker(position: path.coordinate(at: i))
           let head = locationManager.location?.course ?? 0
           
           print("location manager: \(head)")
           carMarker.rotation = 45
           carMarker.icon = carView

           newPath.add(path.coordinate(at: i))
           newPolyline.path = newPath
           newPolyline.strokeColor = UIColor.black
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
        timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(self.animatePolylinePath), userInfo: nil, repeats: true)
    }
    
    
}
