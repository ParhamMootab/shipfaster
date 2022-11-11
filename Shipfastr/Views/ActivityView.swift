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
    
    static let vehicle1 = Vehicle(route: "}ieuEdtldP_KOaFEuB@gADmBR}Bb@kAXmA`@iBh@y@\\mDzAcHbCwBt@gDz@qCh@wEn@yC^gIbAgC`@CnDOfQG~FElDk@AgAA_@R[Rw@jAi@v@SPe@Ti@DMRKAk@Ci@EuAMsASgDq@aDaAeEiB{CuA}HoDqAg@cBg@uASsAImDIkHOoBI}@IsAUqA_@eCaA{CqAmDsA}@WkB]kBKqC@{JTSSq@Eq@GoCWm@GeA?mDd@oCVsCRgBB{EIWAmAOuAe@e@]g@y@VaGbA}S^{HDw@{CUkBMoCSLgCXwG?OEERuE~@oSb@kKyC]uBQsQuAyBOYDFmCTuGR}GNuCVqGl@yRv@_RvBwh@|@{QVgDzA_Gp@wBJSDOzAaGbDmMRc@p@iCtEoR`DgLpD_NlCoKz@kD~AsGt@qCfDaMdEkOfCgKlEoSvDuPp@iD~CoQpC{O~@iHlEk]|Ko|@bCcSd@uDtEDdGFvKJlCB~@?JG~DBdFDhAB|AEfHDfMR|SRvCBFmJBkDPcTvBKv@Kl@A|BFhFX`EHaEIiFY}BGm@@w@JwBJQbTMbS]je@o@rz@OpPCvEFdLX`k@DpGIhIMrLa@he@[f[o@jp@AzHG~HU`KEhGEbKA~AG`AOj@Qf@i@z@aAjBIn@{CtFiAxBaGhKiIpNcDdGoE~Hs@`AkAjBkAvBoBnDoBnDgBhDoFvJcEzGcE`IqGtLu@`ByFhLyM|WkKjUyCvGsC~FyElJw@dBy@zAOb@s@UiCGoBAeAAcAH]Pc@Xk@h@a@p@k@`BEzBG~DCbDGn@[|Bk@jD]fEeAtNgAHo@P_@TYXuBlCs@ZWDYAq@EmCg@k@zIa@nBq@`EyBjMgBxKcBlJwCxP_BxIe@hCSbBWvASdAReAVwARcBd@iCl@mDp@kDlCsOlBsKfByKxBkMp@aE`@oBj@{In@qQhAgTj@oLNeDRyDFcARe@Xe@HIpBm@vAU~ABtBPlCd@|@L^AJ?VI\\Up@i@VMpAWRCVU`CGnFM~KWzCGlB@`BLfARlCz@vD|AdDrArAd@pAZdBT|AHxGLjDHrADvANpAV~@XtEpBvMbG~ChAdDx@|B^jDZhELnEFtABt@@PT@?LB`@RNNNb@Cr@O^YTQB_@BWGSKU_@My@CkA?cADyFNcLHgLFgH@}@|AU|Ca@hDa@xC_@vEo@pCi@fD{@vBu@bHcClD{Ax@]hBi@lAa@jAY|Bc@lBSfAEtBA`FD~JN", locations: [
        CLLocationCoordinate2D(latitude: 49.279848063981305, longitude: -122.91945081880527),
        CLLocationCoordinate2D(latitude: 49.25191140164777, longitude: -123.00389112539482),
        CLLocationCoordinate2D(latitude: 49.31994311243845, longitude: -123.01923812773032),
        ])

    
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


