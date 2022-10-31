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
    
    init(menuItemTapped: ((_ menuItem: MenuItem) -> ())? = nil) {
        self.viewModel = MenuViewModel(menuItemTapped: menuItemTapped)
    }
    
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
                    if viewModel.handleMenuItemTapped(menuItem) {
                        dismiss()
                    }
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
            .alert("Reset All Data?", isPresented: $viewModel.showingResetAlert, actions: {
                Button("Remove Data", role: .destructive) {
                    viewModel.resetAllData()
                    dismiss()
                }
                Button("Cancel", role: .cancel) { }
            }, message: {
                Text("This will permanently remove all trick-or-treat data.")
            })
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
