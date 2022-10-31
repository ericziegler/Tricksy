//
//  TreatNight.swift
//  Tricksy
//
//  Created by Eric Ziegler on 10/30/22.
//

import Foundation

struct TreatNight: Codable {
    var deliveryTimes = [Date]()
}

extension TreatNight {
 
    static var mockData: TreatNight {
        var result = TreatNight()
        
        let formatter = DateFormatter.graph
        result.deliveryTimes = [
            formatter.date(from: "6:00")!,
            formatter.date(from: "6:05")!,
            formatter.date(from: "6:10")!,
            formatter.date(from: "6:15")!,
            formatter.date(from: "6:20")!,
            formatter.date(from: "6:21")!,
            formatter.date(from: "6:22")!,
            formatter.date(from: "6:23")!,
            formatter.date(from: "6:24")!,
            formatter.date(from: "6:25")!,
            formatter.date(from: "6:26")!,
            formatter.date(from: "6:27")!,
            formatter.date(from: "6:28")!,
            formatter.date(from: "6:29")!,
            formatter.date(from: "6:30")!,
            formatter.date(from: "6:35")!,
            formatter.date(from: "6:40")!,
            formatter.date(from: "6:45")!,
            formatter.date(from: "6:46")!,
            formatter.date(from: "6:47")!,
            formatter.date(from: "6:48")!,
            formatter.date(from: "6:50")!,
            formatter.date(from: "6:51")!,
            formatter.date(from: "6:52")!,
            formatter.date(from: "6:53")!,
            formatter.date(from: "6:54")!,
            formatter.date(from: "6:55")!,
            formatter.date(from: "6:56")!,
            formatter.date(from: "6:57")!,
            formatter.date(from: "6:58")!,
            formatter.date(from: "6:58")!,
            formatter.date(from: "6:58")!,
            formatter.date(from: "6:58")!,
            formatter.date(from: "7:05")!,
            formatter.date(from: "7:10")!,
            formatter.date(from: "7:15")!,
            formatter.date(from: "7:20")!,
            formatter.date(from: "7:35")!,
            formatter.date(from: "7:40")!,
            formatter.date(from: "7:45")!,
            formatter.date(from: "7:55")!,
            formatter.date(from: "8:00")!,
        ]
        
        return result
    }
    
}
