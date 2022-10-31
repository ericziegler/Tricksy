//
//  TreatViewModel.swift
//  Tricksy
//
//  Created by Eric Ziegler on 10/30/22.
//

import SwiftUI

class TreatViewModel: ObservableObject {
    
    // MARK: - Enums
    
    enum ModalSheet: String, Identifiable {
        case menu = "menu"
        case graph = "graph"
        
        var id: String {
            return self.rawValue
        }
    }
    
    // MARK: - Properties
    
    private let service = TreatService()
    @Published var treatNight = TreatNight()
    @Published var modalSheet: ModalSheet?
    @Published var showingResetAlert = false
    
    // MARK: - Init
    
    init() {
        loadTreats()
    }
    
    private func loadTreats() {
        if let cachedTreatNight = service.loadTreats() {
            treatNight = cachedTreatNight
        }
    }
    
    // MARK: - Adding
    
    func addToCount() {
        treatNight.deliveryTimes.append(Date())
        service.saveTreats(treatNight)
    }
    
    func removeLastTreat() {
        if treatNight.deliveryTimes.count == 0 {
            return
        }
        treatNight.deliveryTimes.removeLast()
        service.saveTreats(treatNight)
    }
    
    func removeAllData() {
        treatNight.deliveryTimes.removeAll()
        service.saveTreats(treatNight)
    }
    
    // MARK: - Menu Actions
    
    func handleMenuItemTapped(_ menuItem: MenuItem?) {
        guard let menuItem = menuItem else {
            return
        }
        
        switch menuItem {
        case .graph:
            modalSheet = .graph
        case .undoLastTreat:
            removeLastTreat()
        case .resetAll:
            showingResetAlert = true
        default:
            print("No menu item selected.")
        }
    }
    
}
