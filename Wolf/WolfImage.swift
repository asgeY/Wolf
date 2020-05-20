//
//  WolfImage.swift
//  Wolf
//
//  Created by Asge Yohannes on 5/18/20.
//  Copyright © 2020 Asge Yohannes. All rights reserved.
//

import SwiftUI

struct Wolves: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var image: String
    var logo: String
    var color = LinearGradient(Color.darkStart, Color.darkEnd)
    var show: Bool
}

let unicodeHaert = "\u{2661}"

var placeData: [Wolves] = [
    
    Wolves(title: "Wolves", subtitle: "True Love", image: "14", logo:
        "Zoo", color: LinearGradient(.darkStart, .darkEnd), show: false),
    Wolves(title: "Wolves", subtitle: "Wolves life", image: "15", logo: "Zoo", color: LinearGradient(.darkStart, .darkEnd), show: false),
    Wolves(title: "Wolves", subtitle: "Wild", image: "17", logo: "Zoo", color: LinearGradient(.darkStart, .darkEnd), show: false)
]
