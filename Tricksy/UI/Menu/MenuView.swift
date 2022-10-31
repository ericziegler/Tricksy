//
//  MenuView.swift
//  Tricksy
//
//  Created by Eric Ziegler on 10/30/22.
//

import SwiftUI

struct MenuView: View {
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var viewModel = MenuViewModel()
    @Binding var selectedMenuItem: MenuItem
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            //        NavigationStack {
            List (viewModel.menuItems) { menuItem in
                HStack {
                    Image(systemName: menuItem.icon)
                        .foregroundColor(Color(menuItem.displayColor))
                        .font(.title2)
                    Text(menuItem.displayText)
                        .foregroundColor(Color(menuItem.displayColor))
                }
                .listRowBackground(Color.black)
                .listRowSeparator(.hidden)
                .onTapGesture {
                    HapticsManager.lightHaptic()
                    self.selectedMenuItem = menuItem
                    dismiss()
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .padding(.top, 16)
            //            .navigationTitle("Options")
            //            .toolbarColorScheme(.dark, for: .navigationBar)
            //            .toolbarBackground(Color.black, for: .navigationBar)
            //            .toolbarBackground(.visible, for: .navigationBar)
            //            .scrollContentBackground(.hidden)
            //            .background(Color.black)
            //        }
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(selectedMenuItem: .constant(MenuItem.graph))
    }
}
