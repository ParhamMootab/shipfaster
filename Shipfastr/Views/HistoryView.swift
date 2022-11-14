//
//  HistoryView.swift
//  Shipfastr
//
//  Created by Mohammad Esmaeilirad  on 2022-11-04.
//

import SwiftUI

struct HistoryView: View {
    @State var viewIdx: Int
    var body: some View {
        
        switch viewIdx{
        case 1:
            HistoryShipment(date: "Nov 13", time: "12:12 PM", numOfVehicle: "1", timeSpent: "6h 35m", source: "1050 Beach Ave", destinations: ["701 W Georgia St", "900 Canada Pl"], viewIdx: $viewIdx)
        case 2:
            HistoryShipment(date: "Nov 12", time: "1:00 PM", numOfVehicle: "3", timeSpent: "6h 35m", source: "1050 Beach Ave", destinations: ["4700 Kingsway", "8888 University Dr", "4500 Still Creek Dr"], viewIdx: $viewIdx)
        case 3:
            HistoryShipment(date: "Nov 11", time: "9:00 AM", numOfVehicle: "2", timeSpent: "6h 35m", source: "1050 Beach Ave", destinations: ["1895 Lower Mall", "3211 Grant McConachie Way"], viewIdx: $viewIdx)
        case 0:
            List{
                Button {
                    viewIdx = 1
                } label: {
                    HStack {
                        Text("Nov 13, 2022 \n 2 Destinations")
                            .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
                        Spacer()
                        HStack {
                            Text("View Details")
                            Image(systemName: "chevron.right")
                        }
                        .padding(.horizontal)
                        .frame(height: 50.0)
                        .foregroundColor(Color.white)
                        .background(Color("MainBlue"))
                        .clipShape(Capsule())
                        
                    }
                }
                
                Button {
                    viewIdx = 2
                } label: {
                    HStack {
                        Text("Nov 12, 2022 \n 3 Destinations")
                            .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
                        Spacer()
                        HStack {
                            Text("View Details")
                            Image(systemName: "chevron.right")
                        }
                        .padding(.horizontal)
                        .frame(height: 50.0)
                        .foregroundColor(Color.white)
                        .background(Color("MainBlue"))
                        .clipShape(Capsule())
                    }
                }
                
                Button {
                    viewIdx = 3
                } label: {
                    HStack {
                        Text("Nov 11, 2022 \n 2 Destinations")
                            .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
                        Spacer()
                        HStack {
                            Text("View Details")
                            Image(systemName: "chevron.right")
                        }
                        .padding(.horizontal)
                        .frame(height: 50.0)
                        .foregroundColor(Color.white)
                        .background(Color("MainBlue"))
                        .clipShape(Capsule())
                    }
                }
            }
            
        default:
            Text("Default")
        }
        
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(viewIdx: 0)
    }
}
