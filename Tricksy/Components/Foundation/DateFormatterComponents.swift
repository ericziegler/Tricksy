//
//  DateFormatter.swift
//  Tricksy
//
//  Created by Eric Ziegler on 10/30/22.
//

import Foundation

extension DateFormatter {
 
    static var graph: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm"
        return formatter
    }
    
}
