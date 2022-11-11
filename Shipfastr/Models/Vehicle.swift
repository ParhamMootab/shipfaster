//
//  Vehicle.swift
//  Shipfaster
//
//  Created by Mohammad Esmaeilirad  on 2022-11-08.
//

import Foundation
import GoogleMaps


struct Vehicle  {
    
    let route: String?
    let locations: [CLLocationCoordinate2D]
    
//    private lazy var path = GMSPath()
//    private lazy var path2 = [String]()
//    private lazy var polyline = GMSPolyline()
//    private lazy var newPolyline = GMSPolyline()
//    private lazy var newPath = GMSMutablePath()
//    private lazy var carMarker = GMSMarker()
    

    var carView: UIImageView?
    
//    init (coordinates: [CLLocationCoordinate2D] ,route: String?) {
//        self.route = route
//        self.locations = coordinates
//    }
    
    
    
//    mutating func drawRouteOnMap(_ uiViewController: MapViewController) {
//        guard let route = route else {return}
//        guard let path = GMSPath(fromEncodedPath: route) else {return}
//        self.path = path
//
//        polyline = GMSPolyline(path: path)
//        polyline.strokeColor = UIColor.gray
//        polyline.strokeWidth = 2
//        polyline.map = uiViewController.mapView
//
//
//        let car = UIImage(systemName: "box.truck")?.withRenderingMode(.alwaysTemplate)
//        let markerView = UIImageView(image: car)
//        markerView.tintColor = .blue
//        carView = markerView
        
//         Move Camera to the location with animation
//        let bounds = GMSCoordinateBounds(path: path)
//        let insets = UIEdgeInsets(top: 20, left: 40, bottom: 20, right: 40)
//        let camera = GMSCameraUpdate.fit(bounds, with: insets)
//        uiViewController.mapView?.animate(with: camera)
//    }
//
    
//    @objc func animatePolylinePath() {
//       //Iterate each valid coordinate on the path
//
//       if i < path.count() {
//           carMarker.map = nil
//           carMarker = GMSMarker(position: path.coordinate(at: i))
//           carMarker.iconView = carView
//
//           newPath.add(path.coordinate(at: i))
//           newPolyline.path = newPath
//           newPolyline.strokeColor = UIColor.black
//           newPolyline.strokeWidth = 4
//           newPolyline.map = mapView
//           carMarker.map = mapView
//
//           i += 1
//       }
//   }
    
    
}
