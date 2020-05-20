//
//  Color.swift
//  Wolf
//
//  Created by Asge Yohannes on 5/14/20.
//  Copyright © 2020 Asge Yohannes. All rights reserved.
//

import SwiftUI

extension Color {
    
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    
    static let darkStart = Color(red: 50 / 255, green: 60 / 255, blue: 65 / 255)
    static let darkEnd = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255)

    static let lightStart = Color(red: 60 / 255, green: 160 / 255, blue: 240 / 255)
    static let lightEnd = Color(red: 30 / 255, green: 80 / 255, blue: 120 / 255)
    
    static let darkRed = Color(red: 139 / 255, green: 0 / 255, blue: 0 / 255)

}

extension LinearGradient {
    
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
}
