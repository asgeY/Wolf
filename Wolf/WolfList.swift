//
//  WolfList.swift
//  Wolf
//
//  Created by Asge Yohannes on 5/18/20.
//  Copyright © 2020 Asge Yohannes. All rights reserved.
//


import SwiftUI

let screen = UIScreen.main.bounds

struct WolfList: View {
    @State var places = placeData
    @State var active = false
    @State var activeIndex = -1
    @State var activeView = CGSize.zero
    @State var location = ""
    
    enum location {
        case Boston
        case SanFrancisco
        case Tokyo
    }
    
    let cellTitle = "Incredible Wolf Facts"
    
    var body: some View {
        ZStack {
            LinearGradient(Color.darkStart, Color.darkEnd)
                .animation(.linear)
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(spacing: 30.0) {
                    Text(cellTitle)
                        .font(.largeTitle).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 30)
                        .padding(.top, 30)
                        .blur(radius: active ? 20 : 0)
                    
                    ForEach(places.indices, id: \.self) { index in
                        GeometryReader { geometry in
                            WolfView(show: self.$places[index].show,
                                       Wolves: self.places[index],
                                       active: self.$active,
                                       index: index,
                                       activeIndex: self.$activeIndex,
                                       activeView: self.$activeView
                            )
                                .offset(y: self.places[index].show ? -geometry.frame(in: .global).minY : 0)
                                .opacity(self.activeIndex != index && self.active ? 0 : 1)
                                .scaleEffect(self.activeIndex != index && self.active ? 0.5 : 1)
                                .offset(x: self.activeIndex != index && self.active ? screen.width : 0)
                        }
                        .frame(height: 280)
                        .frame(maxWidth: self.places[index].show ? .infinity : screen.width - 60)
                        .zIndex(self.places[index].show ? 1: 0)
                    }
                }
                .frame(width: screen.width)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            }
            .statusBar(hidden: active ? true : false)
        }
    }
}

struct WolfList_Previews: PreviewProvider {
    static var previews: some View {
        WolfList()
    }
}

