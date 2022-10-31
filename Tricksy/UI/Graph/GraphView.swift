//
//  GraphView.swift
//  Tricksy
//
//  Created by Eric Ziegler on 10/30/22.
//

import SwiftUI
import Charts

struct GraphView: View {
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var viewModel = GraphViewModel()
    
    private let curGradient = LinearGradient(
        gradient: Gradient (
            colors: [
                Color.appMain.opacity(0.65),
                Color.appMain.opacity(0.45),
                Color.appMain.opacity(0.25),
            ]
        ),
        startPoint: .top,
        endPoint: .bottom
    )
    
    init(treatNight: TreatNight?) {
        viewModel = GraphViewModel(treatNight: treatNight)
    }
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                Spacer()
                    .padding(.bottom, 10)
                Text("TREATS DELIVERED")
                    .font(.creepsterFont(size: 44))
                    .fontWeight(.bold)
                    .foregroundColor(Color.appMain)
                Chart {
                    ForEach(viewModel.graphDatas, id: \.self) { graphData in
                        LineMark(x: .value("Time", graphData.time),
                                 y: .value("Count", graphData.count)
                        )
                        .foregroundStyle(Color.appMain)
                        .lineStyle(StrokeStyle(lineWidth: 3, lineCap: CGLineCap.round, lineJoin: CGLineJoin.round))
                        .interpolationMethod(.catmullRom)
//                        .symbol() {
//                            Circle()
//                                .fill(Color.appMain)
//                                .frame(width: 12, height: 12)
//                        }
                        AreaMark(x: .value("Time", graphData.time),
                                 y: .value("Count", graphData.count)
                        )
                        .foregroundStyle(curGradient)
                        .interpolationMethod(.catmullRom)
                    }
                }
                .frame(height: 250)
                .padding(20)
                .chartXAxis {
                    AxisMarks(values: .automatic) { value in                        
                        let xLabel = viewModel.xLabel(for: value)
                        AxisGridLine(centered: true, stroke: StrokeStyle())
                            .foregroundStyle(Color.gray)
                        AxisValueLabel {
                            Text(xLabel)
                        }
                        .foregroundStyle(Color.white)
                    }
                }
                .chartYAxis {
                    AxisMarks(values: .automatic) { _ in
                        AxisGridLine(centered: true, stroke: StrokeStyle())
                            .foregroundStyle(Color.gray)
                        AxisTick(stroke: StrokeStyle())
                            .foregroundStyle(Color.gray)
                        AxisValueLabel()
                            .foregroundStyle(Color.white)
                    }
                }
            }
        }
        .onAppear {
            
        }
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView(treatNight: TreatNight.mockData)
    }
}
