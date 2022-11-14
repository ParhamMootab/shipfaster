//
//  HomeView.swift
//  hermes-v5
//
//  Created by Mohammad Esmaeilirad  on 2022-11-04.
//

import GoogleMaps
import SwiftUI

struct ActivityView: View {
    
    static let vehicle1 = Vehicle(route: "m_xkHlufmVQxC`@Hv@r@fAPtAUf@PnAXlAr@f@fAj@xDdAlJj@|GCfBo@lPCjCRnAb@v@\\^fApA@NJVRFPIJq@VmAjAqCxCqH~@sBf@En@Dd@l@RvC@bGK~Ta@`Km@pEg@dCmAdJwAbL}@xGaAjDcErIiElIsEdJaFbKg@hBUzAGnGAhWB|JWr@QTHRTdA^tCL`B?zDDlAIrCQpF@dEjAAvICdTA|i@G`UBzH?`C?hAAZTHPD\\YzFApG?vAD`@P?fAy@v@c@l@J\\Tf@lAz@`An@b@vARr@CdC}@dEkB^?jIyDxDaAxEa@vLFvHAC|M?~P@zNGb]AbFGbD@jEHx@CjDGzV_@jCqApCeBx@s@LsGFsA@oA^aAbAu@dBUfAKpAK`HIhEStBWxDCfI?to@?l@V?lC?jCGlGE?kA@w@T]F{CWGE`EA|@?f@eEC_C?_D?uFEqBQoAE}DWwHAW??p@@pAHhC|@pCbAtBn@dCHtCElC?lTOhSEdCw@lHWjGQbCYbAmAlCW~@{AfCiAlBgDrFgCzDaDxCsCrAyBd@iN`AaFpAyGnCgJpDwEzBgLjHuEhCgEpAmEXkUIqKBkGpA}DLeDWgDuAgC{BoCkDmGeIqGcIsA_AqB]cMFoSN{YReHLuB\\cDrAsBpAmBv@uA\\yAHqECeFGoGGi@A[[iAO{@Wk@i@Se@OaAo@cC_AcBw@i@mFgCaDsAyBi@sCOiAJeIEgDEq@Ou@[_Aw@{DqDl@kAVg@e@eAc@_AYaAt@u@Xo@{@{Ez@zEYn@u@t@|@`Cd@dAWf@m@jAzDpD~@v@t@Zp@NfDDdIDb@Cf@LfCXxErA`EpBZ^Z\\HPPhCRbEh@fCbApEDbCE`@W\\YDg@KSe@Ac@T{@z@cBz@_Az@g@fAa@zAQ@ANOl@@r@@rB@pBB`BBdFDnEAlDy@hDqB|@e@dBi@`Da@lFEnTQr\\UtGGnBJrBbArC|CFh@dAzAlBvCzEtG|BvCfDzD`CtAbC\\`CKfF_BdB_AtA[`DGrBE?YAgCI_N?aQBm]Hws@FiiA@o]DkFLkAr@eCxA{CXwB?sAc@oGOiBIyDAmMFgd@?kh@HkKAkOE_SEcLPqFT_FDuB?qAQuCUqF?cK?mWJ}GHy@f@aBvCaGvQs^|BwFv@_EvBoPv@_HV_DhA}IZcJJwT?cBVqEVgCNiC_@yFsApCw@~BiDbJeCvFaAhAcANw@IaAwASoABkCr@uSk@}GeAmJk@yDg@gAmAs@oAYg@Qm@s@]]_A[cAJ_@CF{@@q@", locations: [
        
        CLLocationCoordinate2D(latitude: 49.279848063981305, longitude: -122.91945081880527),
        CLLocationCoordinate2D(latitude: 49.25191140164777, longitude: -123.00389112539482),
        CLLocationCoordinate2D(latitude: 49.31994311243845, longitude: -123.01923812773032),
    ])
    
    static let vehicle2 = Vehicle(route: "m_xkHlufmVQxC`@Hv@r@fAP|BCnAXlAr@f@fApBfPj@|GCfBs@xTv@fCdBpBLf@d@AJq@bB_FxCqHjEgK~@aB~EaFzFaGlBsBbBqCnC_HvJwXjI{Uz@aFLaKo@uFcBaHuFqTk@kDCkCXyDv@qChAkB|BiBvCQtAb@hCjCxCjHbT|j@hDtIlBrDpChC~BfAzIj@tIX~EVzHB`IP|HX`ATtAz@hBlA~BpBv@gC?cBGyBBqAdA_CnBeDlCiB|CsAnAiAlEcJzAkB|Am@hBPpBdAzA^pCOvEm@~@m@hLyOpG}ItBsCj@u@Vf@xDzIdH`P|C|GxOt^~HfQ|CdHLV\\a@Xc@Xi@\\wAdBaLj@kB`CsDrHuKxEqGd\\wc@`JuKvCq@dFy@nKoGbB}A|DcNhFoSnHiZT}BE_Ig@uNq@_]HoLGwSk@}UMyOm@yKiBgRe@oIBqCbAsJpBqGd\\ak@jIgNvDuDdF{B`Fa@jFF~CAz@@?k@@iB@kBBuIfE?bCo@HdB}BNc@FBiANCbCo@zCw@`@Af@@AxA?zCEvF@xEGrYFdRAjGI`GNjEjGB|HBz\\LbV\\~GL`FHbB?AzE?nB?xC?~HAvNPpCxA@yAAAkIB{R@{HQkDiJImR[mMQgJEqFCSYGS?[JqArAiG_JWCGEAIB_CJAbB@cBzBJ@BBDD?HGTA|HCo@xBkArH[xFSbA{GtUqAbBwFnBq@l@k@n@_@`@AlB?~A?tDIpCC~PEjg@[bc@SpLk@bHmCfL}B`Fq@~@WDa@A_AuA_@g@aBsA_JsLyCwD_BeCeFyF{HsIsKkNmAoBqAyLa@oCgAoAkAM}ElAkAvBa@fFF|In@xWtAv_@ElCgAtGgKn`@_CtJiDfL{EvCeHzE}Eh@sARmAr@_E|E{BlD_KdN_FzGmDtEq@z@M[q@}Ak@oAcC}FkCcF{@jAqHzJcG`I_GvHmE|FMN}@jAUi@eA_CyAiDcA_CwIkSmMqYkBgEw@dAiCfDsCrDsCbDuF~H_DxDcAb@iIh@eAQgDyAeBDoAp@s@x@_B`DeChFwA|AaDzAgClBmB`D_A~BAxAJnCIpAkAf@gD_C}DeAwXq@k@_@gAGoBIgNY{FUyC_AoCoBmAgBwE{K{M}]eHiRqBgEs@{@uCsAsB?uCrAeApAcAzBk@zCMhE^rEvGdVbB`Hn@tFM`K{@`FcUro@oC~GcBpCmBrByMxLmBrDkGxPwBfEu@j@u@F}@Qg@o@g@}Cv@aUs@eKgAqJq@gDmBuAiA[aBqAy@e@y@B}@?HmB", locations: [
        
        CLLocationCoordinate2D(latitude: 49.279848063981305, longitude: -122.91945081880527),
        CLLocationCoordinate2D(latitude: 49.19313007827979, longitude: -122.84289745689237),
        CLLocationCoordinate2D(latitude: 49.17658036861975, longitude: -122.86384014279186),
        CLLocationCoordinate2D(latitude: 49.18937181646324, longitude: -122.85482792140071),
    ])
    
    static let shipments = [
        Shipment(vehicles: [vehicle1, vehicle2])
    ]
    
    @Binding var selectedShipment: Shipment?
    @Binding var isShowing: Bool
    @Binding var isShipmentShowing: Bool
    @Binding var selectedTab: Int
    
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
                        .font(.system(size: 20, weight: .regular))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.bottom, 10)
                    VStack {
                        ForEach(0..<ActivityView.shipments.count, id: \.self) { id in
                            let shipment = ActivityView.shipments[id]
                            Button(action: {
                                isShipmentShowing = true
                                isShowing = false
                                self.selectedShipment = shipment
                            }) {
                                Text("Vancouver" )
                                    .font(.system(size:22, weight: .regular))
                                
                            }
                        }
                        Spacer()
                        Text("Add new shipment")
                            .font(.system(size: 20, weight: .regular))
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.top, 10)
                        Button {
                            selectedTab = 3
                            
                        } label: {
                            Text("Get Started!")
                                .font(.title3)
                                .fontWeight(.bold)
                                .frame(width: 200, height: 50)
                                .background(Color("MainBlue"))
                                .foregroundColor(Color.white)
                                .clipShape(Capsule())
    
                        }
                        Spacer()
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
    
    

