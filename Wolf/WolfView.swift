//
//  WolfView.swift
//  Wolf
//
//  Created by Asge Yohannes on 5/20/20.
//  Copyright © 2020 Asge Yohannes. All rights reserved.
//

import SwiftUI

struct WolfView: View {
    @Binding var show:Bool
    var Wolves: Wolves
    @Binding var active: Bool
    var index: Int
    @Binding var activeIndex: Int
    @Binding var activeView: CGSize
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text(Wolves.title)
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                        Text(Wolves.subtitle)
                            .foregroundColor(Color.white.opacity(0.7))
                    }
                    Spacer()
                    ZStack {
                        Image(Wolves.logo)
                            .opacity(show ? 0 : 1)
                        
                        VStack {
                            Image(systemName: "xmark")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                        }
                        .frame(width: 30, height: 30)
                        .background(Color.black)
                        .clipShape(Circle())
                        .opacity(show ? 1 : 0)
                    }
                }
                Spacer()
                Image(Wolves.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .edgesIgnoringSafeArea(.all)
                    .shadow(color: .gray, radius: 3, x: 3, y: 3)
                .cornerRadius(8)
                    
            }
            .padding(show ? 30 : 20)
            .padding(.top, show ? 30 : 0)
                //        .frame(width: show ? screen.width : screen.width - 60, height: show ? screen.height : 280)
                .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? 460 : 280)
                .background(Wolves.color)
                .shadow(color: .gray, radius: 3, x: 3, y: 3)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                
            .gesture(
                show ?
                    DragGesture().onChanged { value in
                        guard value.translation.height < 300  else { return }
                        guard value.translation.height > 0 else { return }
                        
                        self.activeView = value.translation
                    }
                    .onEnded { value in
                        if self.activeView.height > 50 {
                            self.resetClose()
                        }
                        self.activeView = .zero
                    }
                    : nil
            )
            .onTapGesture {
                self.show.toggle()
                self.active.toggle()
                if self.show {
                    self.activeIndex = self.index
                } else {
                    self.activeIndex = -1
                }
            }
            
            if show {
                WolfDetail(Wolves: Wolves, show: $show, active: $active, activeIndex: $activeIndex)
                    .background(Color.white)
                    .animation(nil)
            }
        }
        .frame(height: show ? screen.height : 280)
        .scaleEffect(1 - self.activeView.height / 1000)
        .shadow(color: .gray, radius: 3, x: 3, y: 3)
        .rotation3DEffect(Angle(degrees: Double(self.activeView.height) / 10), axis: (x: 0.0, y: 10.0, z: 0.0))
        .hueRotation(Angle(degrees: Double(self.activeView.height)))
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .gesture(
            show ?
                DragGesture().onChanged { value in
                    guard value.translation.height < 300  else { return }
                    guard value.translation.height > 0 else { return }
                    
                    self.activeView = value.translation
                }
                .onEnded { value in
                    if self.activeView.height > 50 {
                        self.resetClose()
                    }
                    self.activeView = .zero
                }
                : nil
        )
            .edgesIgnoringSafeArea(.all)
    }
    
    func resetClose() {
        self.show = false
        self.active = false
        self.activeIndex = -1
    }
}
