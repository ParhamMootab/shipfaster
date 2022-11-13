//
//  OptimizerManager.swift
//  Shipfastr
//
//  Created by Parham Shagerdmootab on 2022-11-10.
//


import Foundation
import SwiftUI

class OptimizerManager {
    var url:String
    var addresses: [String: [String]] = ["addresses": []]

    init(addresses: [String]){
        self.url = "https://shippy-mox6xhvzoq-uw.a.run.app/api/optimize"
        for address in addresses{
            self.addresses["addresses"]?.append(address.replacingOccurrences(of: " ", with: "+"))
        }
    }

    func sendRequest() async throws -> OptimizerResponse? {
        guard let url = URL(string: url) else { fatalError() }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: self.addresses, options: .fragmentsAllowed)
        var response: OptimizerResponse? = nil

        let (data, _) = try await URLSession.shared.data(for: request)
        let decodedData = try JSONDecoder().decode(OptimizerResponse.self, from: data)
        response = decodedData
        
        return response
    }

}

