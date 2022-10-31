//
//  MenuViewModel.swift
//  Tricksy
//
//  Created by Eric Ziegler on 10/30/22.
//

import SwiftUI

class MenuViewModel: ObservableObject {
 
    @Published var menuItems: [MenuItem] = [
        MenuItem.graph,
        MenuItem.undoLastTreat,
        MenuItem.resetAll
    ]
    
}
