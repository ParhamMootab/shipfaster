//
//  HistoryShipment.swift
//  Shipfastr
//
//  Created by Parham Shagerdmootab on 2022-11-13.
//

import SwiftUI

struct HistoryShipment: View {
    @State var date: String
    @State var time: String
    @State var numOfVehicle: String
    @State var timeSpent: String
    @State var source: String
    @State var destinations: [String]
    @Binding var viewIdx: Int
    
    var body: some View {
        VStack{
            HStack {
                Button {
                    viewIdx = 0
                } label: {
                    Image(systemName: "arrowshape.turn.up.backward.fill")
                        .resizable()
                        .foregroundColor(Color.white)
                        .frame(width: 30.0, height: 30.0)
                        
                }
                
                Text("Shipment Information")
                    .font(.title)
                    .frame(alignment: .top)
                    .foregroundColor(Color.white)
                
            }
            Spacer()
            
            List{
                HStack {
                    Text("Shipment Date ")
                    Spacer()
                    Text("\(date)")
                        .font(.body)
                }.font(.headline)
                HStack {
                    Text("Shipment Time ")
                    Spacer()
                    Text("\(time)")
                        .font(.body)
                }.font(.headline)
                HStack {
                    Text("Number of Vehicles used ")
                    Spacer()
                    Text("\(numOfVehicle)")
                        .font(.body)
                }.font(.headline)
                HStack {
                    Text("Time Spent ")
                    Spacer()
                    Text("\(timeSpent)")
                        .font(.body)
                }.font(.headline)
                HStack {
                    Text("Source")
                    Spacer()
                    Text("\(source)")
                        .font(.body)
                }.font(.headline)
                HStack {
                    Text("Destinations")
                    Spacer()
                    VStack(alignment: .leading){
                        ForEach(destinations, id: \.self){
                            destination in
                            HStack {
                                Image(systemName: "mappin")
                                Text("\(destination)")
                                    .font(.body)
                            }
                        }
                    }
                }.font(.headline)
            }
        }
        .frame(maxWidth:.infinity, maxHeight: .infinity)
        .background(Color("MainBlue"))
    }
}

struct HistoryShipment_Previews: PreviewProvider {
    static var previews: some View {
        HistoryShipment(date: "Nov 13", time: "10:10 AM", numOfVehicle: "5", timeSpent: "2h 53m", source: "1330 Burrard St", destinations: ["1277 Nelson St", "935 Marine Dr","935 Harbourside Dr"], viewIdx: .constant(3))
    }
}
