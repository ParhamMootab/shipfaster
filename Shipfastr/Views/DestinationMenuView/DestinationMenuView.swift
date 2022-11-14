//
//  DestinationMenuView.swift
//  Shipfastr
//
//  Created by Parham Shagerdmootab on 2022-11-09.
//

import SwiftUI
import GoogleMaps
import GooglePlaces

struct DestinationMenuView: View {
    @State var locationList: [String] = Array(repeating: "", count: 20)
    @State var destinationNum = 1
    @Binding var selectedTab: Int
    @Binding var selectedShipment: Shipment?
    @Binding var isShipmentShowing: Bool
    
    
    var body: some View {
        VStack{
    
            HStack{
                ZStack{
                    Capsule()
                        .frame(width: .infinity,height: 60.0)
                        .foregroundColor(Color("LightGray"))
                    
                    TextField("Source", text: $locationList[0])
                        .padding(.leading)
                        .frame(height: 50)
                }
                
                Button {
                    destinationNum += 1
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 50.0, height: 50.0)
                        .foregroundColor(Color("MainBlue"))
                }
            }
            ScrollView{
                ForEach(1..<destinationNum, id: \.self){id in
                    HStack{
                        ZStack{
                            Capsule()
                                .frame(width: .infinity,height: 60.0)
                                .foregroundColor(Color("DarkGray"))
                            
                            TextField("Destination", text: $locationList[id])
                                .padding(.leading)
                                .frame(height: 50)
                        }
                        Button {
                            locationList.remove(at: id)
                            for i in (id+1)..<locationList.count{
                                if locationList[i] != ""{
                                    locationList[i - 1] = locationList[i]
                                }
                            }
                            locationList.removeLast()
                            destinationNum -= 1
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color.red)
                                .opacity(0.6)
                                
                        }
                    }
                
                }
            }
            
            let space = CGFloat(650 - destinationNum * 65)
            Spacer()
                .frame(height: space)
            Button {
                Task{
                    do{
                        let optimizer = OptimizerManager(addresses: locationList)
                        
                        let optimizedRoutes = try await optimizer.sendRequest()
                        if let optimizedRoutes = optimizedRoutes {
                            selectedShipment = shipmentMaker(optimzedRoutes: optimizedRoutes)
                        }
                    }catch{
                        print("Error from button")
                    }
                }
                
                selectedTab = 0
                isShipmentShowing = true
                
            } label: {
                HStack {
                    Image(systemName: "location.fill")
                    Text("Done")
                        .font(.title3)
                        .fontWeight(.bold)
                }
                .frame(width: 300, height: 50)
                .background(Color("MainBlue"))
                .foregroundColor(Color.white)
                .clipShape(Capsule())
                .padding(.bottom, 50)
            }
            
        }
        .padding([.leading, .trailing], 30.0)
    }
    
    func shipmentMaker(optimzedRoutes: OptimizerResponse) -> Shipment {
        var shipment: Shipment
        var vehicles: [Vehicle] = []
        var locations: [CLLocationCoordinate2D] = []
        for(_, info) in optimzedRoutes{
            if let info = info{
                for coordinate in info.coordinates {
                    locations.append(CLLocationCoordinate2D(latitude: coordinate.lat, longitude: coordinate.lng))
                }
                let vehicle = Vehicle(route: info.overviewPolyline, locations: locations)
                vehicles.append(vehicle)
            }
            
        }
        shipment = Shipment(vehicles: vehicles)
        return shipment
    }
}

struct DestinationMenuView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationMenuView(selectedTab: .constant(3), selectedShipment: .constant(nil), isShipmentShowing: .constant(false))
    }
}
