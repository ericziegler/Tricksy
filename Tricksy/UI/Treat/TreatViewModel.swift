//
//  TreatViewModel.swift
//  Tricksy
//
//  Created by Eric Ziegler on 10/30/22.
//

import SwiftUI

class TreatViewModel: ObservableObject {
    
    // MARK: - Properties
    
    private let service = TreatService()
    @Published var treatNight = TreatNight()
    
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
        treatNight.deliveryTimes.removeLast()
        service.saveTreats(treatNight)
    }
    
}
