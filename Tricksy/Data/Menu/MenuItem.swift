//
//  MenuItem.swift
//  Tricksy
//
//  Created by Eric Ziegler on 10/30/22.
//

import Foundation

enum MenuItem: CaseIterable, Identifiable {
    
    var id : String { UUID().uuidString }
    
    case graph
    case undoLastTreat
    case resetAll
    
    var displayText: String {
        switch self {
        case .graph:
            return "View Graph"
        case .undoLastTreat:
            return "Undo Last Treat"
        case .resetAll:
            return "Reset All Data"
        }
    }
    
    var displayColor: String {
        switch self {
        case .resetAll:
            return "appDestructive"
        default:
            return "appLight"
        }
    }
    
    var icon: String {
        switch self {
        case .graph:
            return "chart.xyaxis.line"
        case .undoLastTreat:
            return "arrow.uturn.backward"
        case .resetAll:
            return "clear"
        }
    }
    
}
