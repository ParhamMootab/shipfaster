//
//  OptimizerResponse.swift
//  Shipfastr
//
//  Created by Parham Shagerdmootab on 2022-11-12.
//

import Foundation


struct OptimizerResponseClass: Codable {
    let coordinates: [Coordinate]
    let overviewPolyline: String

    enum CodingKeys: String, CodingKey {
        case coordinates
        case overviewPolyline = "overview_polyline"
    }
}

struct Coordinate: Codable {
    let lat, lng: Double
}

typealias OptimizerResponse = [String: OptimizerResponseClass?]
