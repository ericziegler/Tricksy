//
//  GraphViewModel.swift
//  Tricksy
//
//  Created by Eric Ziegler on 10/30/22.
//

import SwiftUI
import Charts

class GraphViewModel: ObservableObject {
    
    private var treatNight: TreatNight?
    var graphDatas = [GraphData]()
//    var graphDataDict = [String : GraphData]()
//    var sortedKeys = [String]()
    
    init(treatNight: TreatNight? = nil) {
        self.treatNight = treatNight
        setupChartData()
    }
    
    private func setupChartData() {
        guard let treatNight = treatNight else {
            return
        }
        
        var graphDataDict = [String : GraphData]()
        
        for curDate in treatNight.deliveryTimes {
            let roundedDate = roundTimeToNearestQuarterHour(time: curDate)
            let dateKey = DateFormatter.graph.string(from: roundedDate)
            if var value = graphDataDict[dateKey] {
                value.count += 1
                graphDataDict[dateKey] = value
            } else {
                let graphData = GraphData(time: dateKey, count: 1)
                graphDataDict[dateKey] = graphData
            }
        }
        
        graphDatas.removeAll()
        let sortedKeys = Array(graphDataDict.keys).sorted { $0 < $1 }
        for curKey in sortedKeys {
            if let graphData = graphDataDict[curKey] {
                graphDatas.append(graphData)
            }
        }
    }
    
    private func roundTimeToNearestQuarterHour(time: Date) -> Date {
        // Parameters
        let minuteGranuity = 15
        
        // Find current date and date components
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: time)
        let minute = calendar.component(.minute, from: time)
        
        // Round down to nearest date:
        let floorMinute = minute - (minute % minuteGranuity)
        let floorDate = calendar.date(bySettingHour: hour,
                                      minute: floorMinute,
                                      second: 0,
                                      of: time)!
        return floorDate
    }
    
    func xLabel(for time: AxisValue) -> String {
        guard let timeString = time.as(String.self) else {
            return ""
        }
        
        if (timeString.contains("15") || timeString.contains("45")) {
            return ""
        }
        return timeString
    }
    
}
