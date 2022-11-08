//
//  HomeView.swift
//  Shipfstr
//
//  Created by Mohammad Esmaeilirad  on 2022-11-04.
//

import SwiftUI

struct HomeView: View {
    
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
                    .transition(.move(edge: .leading))
                
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
                    Text("This is cotent area")
                        .font(.system(size: 25, weight: .regular))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.bottom, 10)
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
//        HomeView(isShowing: .constant(true))
        ContentView()
    }
}


struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner
    
    struct CornerRadiusShape: Shape {

        var radius = CGFloat.infinity
        var corners = UIRectCorner.allCorners

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}
