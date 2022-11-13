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
    var addresses: [String]
    var response: OptimizerResponse?

    init(addresses: [String]){
        self.url = "https://flask-fire-mox6xhvzoq-uw.a.run.app/api/optimize"
        self.addresses = []
        for address in addresses{
            self.addresses.append(address.replacingOccurrences(of: " ", with: "+"))
        }
        self.response = sendRequest()
    }

    func sendRequest() -> OptimizerResponse? {
        guard let url = URL(string: url) else { fatalError() }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: self.addresses, options: .fragmentsAllowed)
        var response: OptimizerResponse?

        let task = URLSession.shared.dataTask(with: request) { (data, httpResponse, error) -> Void in
            if error != nil {
                print("Error sending request to API")
                return
            }

            guard let httpResponse = httpResponse as? HTTPURLResponse else {return}

            if httpResponse.statusCode == 200 {
                guard let data = data else {
                    return
                }

                DispatchQueue.main.async {
                    do{
                        let decodedData = try JSONDecoder().decode(OptimizerResponse.self, from: data)
                        response = decodedData
                    }catch let error{
                        print("Error here: ", error)
                    }

                }

            }
        }
        task.resume()
        return response
    }

}

