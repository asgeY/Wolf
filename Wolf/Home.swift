//
//  Home.swift
//  Wolf
//
//  Created by Asge Yohannes on 5/13/20.
//  Copyright © 2020 Asge Yohannes. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State var index = 0
    let images: [String] = ["1", "2", "3", "4", "5", "6","7","8","9","10","11"]
    
    let imageFrameSize: CGFloat = 50
    let imageFrameHeight: CGFloat = 650
    let imageMinScaleRatio: CGFloat = 0.9
    
    var body: some View {
        
        ZStack {
            LinearGradient(Color.darkStart, Color.darkEnd)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center) {
                Text("Wolves")
                    .font(.largeTitle)
                    .padding(.top,5)
                
                GeometryReader { geometry in
                    
                    ImageCarousel(index: self.$index.animation(), maxIndex: self.images.count - 1) {
                        ForEach(0..<self.images.count) { index in
                            
                            Image(self.images[index])
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geometry.size.width - self.imageFrameSize, height: self.imageFrameHeight)
                                .scaleEffect(self.index == index ? 1.0 : self.imageMinScaleRatio)
                                .animation(.easeInOut)
                                .cornerRadius(self.index == index ? 15 : 30)
                                .clipped()
                        }
                    }
                }
                .frame(height: self.imageFrameHeight + 10)
                Spacer()
            }
            
        }
    }
}
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
