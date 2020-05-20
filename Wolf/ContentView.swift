//
//  ContentView.swift
//  Wolf
//
//  Created by Asge Yohannes on 5/13/20.
//  Copyright © 2020 Asge Yohannes. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var isActivated:Bool = false
    @ObservedObject var menuVM = MenuViewModel()
    var body: some View {
        ZStack {
            menuVM.selectedMenu.menuView
            
            VStack {
                Spacer()
                
                ZStack {
                    ForEach(0..<menuVM.menus.count) { i in
                        MenuButton(isActivated: self.$isActivated,
                                   menuVM: self.menuVM,
                                   currentItemIndex: i)
                    }
                    SelectedMenu(isActivated: self.$isActivated,
                                 menuItem: menuVM.selectedMenu)
                }
            }
            .edgesIgnoringSafeArea(isActivated ? .all : .horizontal)
            .animation(.spring())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
