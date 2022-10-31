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
    @Published var showingResetAlert = false
    
    var menuItemTapped: ((_ menuItem: MenuItem) -> ())?
    
    init(menuItemTapped: ((_ menuItem: MenuItem) -> ())? = nil) {
        self.menuItemTapped = menuItemTapped
    }
    
    func handleMenuItemTapped(_ menuItem: MenuItem) -> Bool {
        if menuItem == .resetAll {
            showingResetAlert = true
            return false
        } else {
            menuItemTapped?(menuItem)
            return true
        }
    }
    
    func resetAllData() {
        menuItemTapped?(.resetAll)
    }
    
}
