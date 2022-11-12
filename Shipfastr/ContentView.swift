//
//  ContentView.swift
//  hermes-v5
//
//  Created by Mohammad Esmaeilirad  on 2022-11-03.


import SwiftUI

struct ContentView: View {
    @State var selectedTab = 0
    @State var showHomeSheet: Bool = true
    @State var showActivitySheet: Bool = false
    @State var selectedShipment: Shipment?
    
    var body: some View {
        VStack {
            ZStack {
                switch selectedTab {
                case 2:
                    HistoryView()
                default:
//                MapViewControllerBridge(selectedShipment: $selectedShipment)
//                        .ignoresSafeArea(edges: .top)
                   
                    HistoryView()
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "box.truck")
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                    })
                    .frame(width: 50, height: 50)
                    .background(.white)
                    .cornerRadius(25)
                    .offset(
                        x: 150,
                        y: 200
                    
                    )
                }
                HomeView(isShowing: $showHomeSheet)
                ActivityView(selectedShipment: $selectedShipment, isShowing: $showActivitySheet)
            }
            Spacer()
//            Divider()
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


