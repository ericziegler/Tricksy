//
//  TreatService.swift
//  Tricksy
//
//  Created by Eric Ziegler on 10/30/22.
//

import Foundation

final class TreatService {
 
    private let treatNightCacheKey = "treatNightCacheKey"
    private let userDefaults = UserDefaults.standard
    
    func loadTreats() -> TreatNight? {
        guard let cachedTreatNight = userDefaults.object(forKey: treatNightCacheKey) as? Data else {
            return nil
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        if let treatNight = try? decoder.decode(TreatNight.self, from: cachedTreatNight) {
            return treatNight
        }
        
        return nil
    }
    
    func saveTreats(_ treatNight: TreatNight) {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        if let encodedTreatNight = try? encoder.encode(treatNight) {
            userDefaults.set(encodedTreatNight, forKey: treatNightCacheKey)
        }
    }
    
}
