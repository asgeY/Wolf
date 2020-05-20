//
//  MenuItem.swift
//  Wolf
//
//  Created by Asge Yohannes on 5/13/20.
//  Copyright © 2020 Asge Yohannes. All rights reserved.
//
import SwiftUI

struct MenuItem {
    let id =  UUID()
    let color: Color
    let icon: String
    let menuView: AnyView
    var selected:Bool
}
