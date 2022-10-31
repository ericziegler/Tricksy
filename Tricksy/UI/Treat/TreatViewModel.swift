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
        
        var id: String {
            return self.rawValue
        }
    }
    
    // MARK: - Properties
    
    private let service = TreatService()
    @Published var treatNight = TreatNight()
    @Published var modalSheet: ModalSheet?
    
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
    
    func handleMenuItemTapped(_ menuItem: MenuItem) {
        switch menuItem {
        case .graph:
            print("GRAPH")
        case .undoLastTreat:
            removeLastTreat()
        case .resetAll:
            removeAllData()
        }
    }
    
}
