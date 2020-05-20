//
//  MenuViewModel.swift
//  Wolf
//
//  Created by Asge Yohannes on 5/13/20.
//  Copyright © 2020 Asge Yohannes. All rights reserved.
//
import SwiftUI

class MenuViewModel: ObservableObject {
    
    @Published var menus:[MenuItem] = [
        MenuItem(color: .darkRed, icon: "house", menuView: AnyView(Home()), selected: true),
        MenuItem(color: .blue, icon: "photo.fill", menuView: AnyView(WolfList()), selected: false),
        MenuItem(color: .green, icon: "mappin.circle.fill", menuView: AnyView(WolfList()), selected: false),
        MenuItem(color: .orange, icon: "moon.stars.fill", menuView: AnyView(WolfList()), selected: false),
        MenuItem(color: .yellow, icon: "square.and.arrow.up.fill", menuView: AnyView(WolfList()), selected: false)
    ]
    
    var selectedMenu:MenuItem {
        guard let selected = menus.filter({$0.selected}).first  else {
            fatalError("You need to set one of the MenuItems in MenuViewModel.menus as selected: true")
        }
        return selected
    }

}
