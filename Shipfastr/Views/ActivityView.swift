//
//  HomeView.swift
//  hermes-v5
//
//  Created by Mohammad Esmaeilirad  on 2022-11-04.
//

import GoogleMaps
import SwiftUI

struct ActivityView: View {
    @Binding var selectedTab: Int
    let shipments = [
        Shipment(city: "San Francisco", coordinate: CLLocationCoordinate2D(latitude: 37.7576, longitude: -122.4194)),
        Shipment(city: "Seattle", coordinate: CLLocationCoordinate2D(latitude: 47.6131742, longitude: -122.4824903)),
        Shipment(city: "Singapore", coordinate: CLLocationCoordinate2D(latitude: 1.3440852, longitude: 103.6836164)),
        Shipment(city: "Sydney", coordinate: CLLocationCoordinate2D(latitude: -33.8473552, longitude: 150.6511076)),
        Shipment(city: "Tokyo", coordinate: CLLocationCoordinate2D(latitude: 35.6684411, longitude: 139.6004407))
      ]
    
    @Binding var isShowing: Bool
    
    @State private var currHeight: CGFloat = 100
    
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if isShowing {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                        currHeight = 100
                    }
                MainMenuView(selectedTab: $selectedTab, currHeight: currHeight, isShowing: $isShowing, shipments: shipments)
                .transition(.move(edge: .trailing))
                .task {
                    currHeight = 100
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea(edges: .top)
        .animation(.easeInOut, value: isShowing)
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
//        HomeView(isShowing: .constant(true))
        ContentView()
    }
}


