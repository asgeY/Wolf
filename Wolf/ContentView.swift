//
//  ContentView.swift
//  Wolf
//
//  Created by Asge Yohannes on 5/13/20.
//  Copyright © 2020 Asge Yohannes. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
             Home()
                   Rectangle()
                       .foregroundColor(.clear)
                       .frame(maxWidth: .infinity, maxHeight: .infinity)
                   FloatingMenu()
                       .padding()
               }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
