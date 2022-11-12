//
//  ContentView.swift
//  hermes-v5
//
//  Created by Mohammad Esmaeilirad  on 2022-11-03.


import SwiftUI

struct ContentView: View {
    
//    State for showing views
    @State var selectedTab = 0
    @State var showHomeSheet: Bool = true
    @State var showActivitySheet: Bool = false
    
    
//    state for showing shipment animation
    @State var selectedShipment: Shipment?
    @State var isShipmentShowing: Bool = false
    
    
    var body: some View {
        VStack {
            ZStack {
                switch selectedTab {
                case 2: 
                    HistoryView()
                    
                case 3:
                    DestinationMenuView()
                default:
                    MapViewControllerBridge(selectedShipment: $selectedShipment, isShipmentShowing: $isShipmentShowing)
                        .ignoresSafeArea()
                    
                    if isShipmentShowing {
                        VStack {
                            HStack {
                                Button(action: {
                                    withAnimation {
                                        isShipmentShowing = false
                                        
                                    }
                                    showActivitySheet = true
                                    selectedShipment?.vehicles.forEach {
                                        $0.resetAnimation()
                                    }
                                }, label: { 
                                    Image(systemName: "chevron.backward")
                                        .frame(width: 30, height: 30) 
                                        .foregroundColor(.blue)
                                })
                                .frame(maxWidth: 40, maxHeight: 40)
                                .background(.white)
                                .cornerRadius(25)
                                .offset(
                                    x: 10,
                                    y: 0
                                )
                                 
                                Spacer()
                            }
                            Spacer()
                            HStack {
                                Spacer()
                                Button(action: { 
                                    selectedShipment?.vehicles.forEach {
                                        $0.startAnimationTimer()
                                    }
                                }, label: {
                                    Image(systemName: "car.circle.fill")
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.white)
                                })
                                .frame(maxWidth: 50, maxHeight: 50)
                                .background(.blue)
                                .cornerRadius(25)
                                .offset(
                                    x: -10,
                                    y: -200
                                )
                                .disabled(isShipmentShowing == false)
                            }.transition(.asymmetric(insertion: .slide, removal: .opacity))
                        }
                    }
                    
                }
                HomeView(isShowing: $showHomeSheet)
                ActivityView(selectedShipment: $selectedShipment, isShowing: $showActivitySheet, isShipmentShowing: $isShipmentShowing)
            }
//            Spacer()
//            Divider()
            if !isShipmentShowing {
                HStack {
                    Spacer()
                    Button(action: {
                        self.selectedTab = 0
                        showActivitySheet = false
                        showHomeSheet.toggle()
                    }, label: {
                        Image(systemName: self.selectedTab == 0 ? "house.fill" : "house")
                            .scaleEffect(selectedTab == 0 ? 1.25 : 1.0 )
                            .font(.system(size: 22))
                            .foregroundColor(self.selectedTab == 0 ? .blue : .gray)
                    })
                    Spacer()
                    Button(action: {
                        self.selectedTab = 1
                        showHomeSheet = false
                        showActivitySheet.toggle()
                    }, label: {
                        Image(systemName: self.selectedTab == 1 ? "pin.fill" : "pin")
                            .scaleEffect(selectedTab == 1 ? 1.25 : 1.0 )
                            .font(.system(size: 22))
                            .foregroundColor(self.selectedTab == 1 ? .pink : .gray)
                    })
                    
                    Spacer()
                    Button(action: {
                        self.selectedTab = 2
                        showHomeSheet = false
                        showActivitySheet = false
                    }, label: {
                        Image(systemName: self.selectedTab == 2 ? "star.fill" : "star")
                            .scaleEffect(selectedTab == 2 ? 1.25 : 1.0 )
                            .font(.system(size: 22))
                            .foregroundColor(self.selectedTab == 2 ? .yellow : .gray)
                    })
                    Spacer()
                }
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


