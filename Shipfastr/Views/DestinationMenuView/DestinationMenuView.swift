//
//  DestinationMenuView.swift
//  Shipfastr
//
//  Created by Parham Shagerdmootab on 2022-11-09.
//

import SwiftUI

struct DestinationMenuView: View {
    @State var locationList: [String] = Array(repeating: "", count: 20)
    @State var destinationNum = 1
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
            let space = CGFloat(650 - destinationNum * 65)
            Spacer()
                .frame(height: space)
            if locationList.count >= 1{
                Text(locationList.joined(separator: " "))
            }
        }
        .padding([.leading, .trailing], 30.0)
    }
}

struct DestinationMenuView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationMenuView()
    }
}
