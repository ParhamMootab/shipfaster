//
//  HomeView.swift
//  hermes-v5
//
//  Created by Mohammad Esmaeilirad  on 2022-11-04.
//

import GoogleMaps
import SwiftUI

struct ActivityView: View {
    
    static let vehicle1 = Vehicle(route: "}ieuEdtldP_KOaFEuB@gADmBR}Bb@kAXmA`@iBh@y@\\mDzAcHbCwBt@gDz@qCh@wEn@yC^gIbAgC`@CnDOfQG~FElDk@AgAA_@R[Rw@jAi@v@SPe@Ti@DMRKAk@Ci@EuAMsASgDq@aDaAeEiB{CuA}HoDqAg@cBg@uASsAImDIkHOoBI}@IsAUqA_@eCaA{CqAmDsA}@WkB]kBKqC@{JTSSq@Eq@GoCWm@GeA?mDd@oCVsCRgBB{EIWAmAOuAe@e@]g@y@VaGbA}S^{HDw@{CUkBMoCSLgCXwG?OEERuE~@oSb@kKyC]uBQsQuAyBOYDFmCTuGR}GNuCVqGl@yRv@_RvBwh@|@{QVgDzA_Gp@wBJSDOzAaGbDmMRc@p@iCtEoR`DgLpD_NlCoKz@kD~AsGt@qCfDaMdEkOfCgKlEoSvDuPp@iD~CoQpC{O~@iHlEk]|Ko|@bCcSd@uDtEDdGFvKJlCB~@?JG~DBdFDhAB|AEfHDfMR|SRvCBFmJBkDPcTvBKv@Kl@A|BFhFX`EHaEIiFY}BGm@@w@JwBJQbTMbS]je@o@rz@OpPCvEFdLX`k@DpGIhIMrLa@he@[f[o@jp@AzHG~HU`KEhGEbKA~AG`AOj@Qf@i@z@aAjBIn@{CtFiAxBaGhKiIpNcDdGoE~Hs@`AkAjBkAvBoBnDoBnDgBhDoFvJcEzGcE`IqGtLu@`ByFhLyM|WkKjUyCvGsC~FyElJw@dBy@zAOb@s@UiCGoBAeAAcAH]Pc@Xk@h@a@p@k@`BEzBG~DCbDGn@[|Bk@jD]fEeAtNgAHo@P_@TYXuBlCs@ZWDYAq@EmCg@k@zIa@nBq@`EyBjMgBxKcBlJwCxP_BxIe@hCSbBWvASdAReAVwARcBd@iCl@mDp@kDlCsOlBsKfByKxBkMp@aE`@oBj@{In@qQhAgTj@oLNeDRyDFcARe@Xe@HIpBm@vAU~ABtBPlCd@|@L^AJ?VI\\Up@i@VMpAWRCVU`CGnFM~KWzCGlB@`BLfARlCz@vD|AdDrArAd@pAZdBT|AHxGLjDHrADvANpAV~@XtEpBvMbG~ChAdDx@|B^jDZhELnEFtABt@@PT@?LB`@RNNNb@Cr@O^YTQB_@BWGSKU_@My@CkA?cADyFNcLHgLFgH@}@|AU|Ca@hDa@xC_@vEo@pCi@fD{@vBu@bHcClD{Ax@]hBi@lAa@jAY|Bc@lBSfAEtBA`FD~JN", locations: [
        CLLocationCoordinate2D(latitude: 49.279848063981305, longitude: -122.91945081880527),
        CLLocationCoordinate2D(latitude: 49.25191140164777, longitude: -123.00389112539482),
        CLLocationCoordinate2D(latitude: 49.31994311243845, longitude: -123.01923812773032),
        ])
    
    static let shipments = [
        Shipment(city: "Vancouver", vehicles: [vehicle1])
      ]
    
    @State var selectedShipment: Shipment?

    
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


