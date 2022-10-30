//
//  TreatView.swift
//  Tricksy
//
//  Created by Eric Ziegler on 10/30/22.
//

import SwiftUI

struct TreatView: View {
    
    @StateObject var viewModel = TreatViewModel()
    
    var body: some View {
        ZStack {
            Color.appDark
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 16) {
                HStack {
                    Button {
                        HapticsManager.lightHaptic()
                        print("SHOW MENU")
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }
                    .foregroundColor(.appLight)
                    .font(.largeTitle)
                    .padding(.leading, 16)
                    Spacer()
                }
                Color.clear
                    .overlay(
                        VStack {
                            Text("TREATS DELIVERED")
                                .font(.creepsterFont(size: 44))
                                .fontWeight(.bold)
                                .foregroundColor(Color.appLight)
                            Text("\(viewModel.treatNight.deliveryTimes.count)")
                                .font(Font.creepsterFont(size: 175))
                                .foregroundColor(Color.appMain)
                        }
                    )
                ActionButton(actionText: "Deliver Treat") {
                    HapticsManager.strongHaptic()
                    viewModel.addToCount()
                }
            }
            .padding(.top, 16)
        }
    }
}

struct TreatView_Previews: PreviewProvider {
    static var previews: some View {
        TreatView()
    }
}
