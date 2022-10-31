//
//  TreatView.swift
//  Tricksy
//
//  Created by Eric Ziegler on 10/30/22.
//

import SwiftUI

struct TreatView: View {
    
    @StateObject var viewModel = TreatViewModel()
    @State var selectedMenuItem: MenuItem = MenuItem.none
    
    var body: some View {
        ZStack {
            Color.appDark.edgesIgnoringSafeArea(.all)
            VStack(spacing: 16) {
                HStack {
                    Button {
                        HapticsManager.lightHaptic()
                        viewModel.modalSheet = .menu
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
            .sheet(item: $viewModel.modalSheet, onDismiss: {
                self.viewModel.handleMenuItemTapped(self.selectedMenuItem)
            }, content: { sheet in
                switch sheet {
                case .menu:
                    MenuView(selectedMenuItem: $selectedMenuItem)
                    .presentationDetents([.medium, .fraction(0.18)])
                case .graph:
                    GraphView()
                }
            })
            .alert("Reset All Data?", isPresented: $viewModel.showingResetAlert, actions: {
                Button("Remove Data", role: .destructive) {
                    viewModel.removeAllData()
                }
                Button("Cancel", role: .cancel) { }
            }, message: {
                Text("This will permanently remove all trick-or-treat data.")
            })
        }
        .preferredColorScheme(.dark)
    }
}

struct TreatView_Previews: PreviewProvider {
    static var previews: some View {
        TreatView()
    }
}
