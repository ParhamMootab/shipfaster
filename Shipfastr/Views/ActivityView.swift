//
//  HomeView.swift
//  hermes-v5
//
//  Created by Mohammad Esmaeilirad  on 2022-11-04.
//

import GoogleMaps
import SwiftUI

struct ActivityView: View {
    
    static let shipments = [
        Shipment(city: "San Francisco", coordinate: CLLocationCoordinate2D(latitude: 37.7576, longitude: -122.4194)),
        Shipment(city: "Seattle", coordinate: CLLocationCoordinate2D(latitude: 47.6131742, longitude: -122.4824903)),
        Shipment(city: "Singapore", coordinate: CLLocationCoordinate2D(latitude: 1.3440852, longitude: 103.6836164)),
        Shipment(city: "Sydney", coordinate: CLLocationCoordinate2D(latitude: -33.8473552, longitude: 150.6511076)),
        Shipment(city: "Tokyo", coordinate: CLLocationCoordinate2D(latitude: 35.6684411, longitude: 139.6004407))
      ]
    
    @Binding var isShowing: Bool
    
    @State private var currHeight: CGFloat = 100
    let minHeight: CGFloat = 100
    let maxHeight: CGFloat = 300
    let closeHeight: CGFloat = 50
    
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
                mainView
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
    
    var mainView: some View {
        VStack {
            // handle
            ZStack {
                Capsule()
                    .frame(width: 40, height: 6)
            }
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .background(Color.white.opacity(0.00001)) // keep for dragging
            .gesture(dragGesture)
            ZStack {
                VStack {
//                    This is the content area to edit
                    Text("Demo Shipments")
                        .font(.system(size: 25, weight: .regular))
                        .multilineTextAlignment(.center)
//                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.bottom, 10)
                    VStack {
                        
                        ForEach(0..<ActivityView.shipments.count, id: \.self) { id in
                            let marker = ActivityView.shipments[id]
                          Button(action: {
//                            buttonAction(marker)
                          }) {
                              Text(marker.city )
                          }
                        }
                    }
                    .frame(width: .infinity)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom, 35)
        }
        .frame(height: currHeight, alignment: .top)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10, corners: [.topLeft, .topRight])
    }
    
    @State private var prevDragTranslation = CGSize.zero
    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { val in
                var newHeight = currHeight - val.translation.height
                
                if newHeight > maxHeight {
                    newHeight = maxHeight
                } else if newHeight < minHeight {
                    newHeight = minHeight
                }
                else if newHeight < closeHeight {
                    isShowing = false
                }
                
                currHeight = newHeight
            }
            .onEnded { val in
//                prevDragTranslation = .zero
                let percentage = currHeight / maxHeight
                var finalHeight = maxHeight
                
                if percentage < 0.45 {
                    finalHeight = minHeight
                }
                withAnimation(Animation.easeOut(duration: 0.3)) {
                    currHeight = finalHeight
                }
            }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
//        HomeView(isShowing: .constant(true))
        ContentView()
    }
}


