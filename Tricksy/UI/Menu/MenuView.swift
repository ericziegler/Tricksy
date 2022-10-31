//
//  MenuView.swift
//  Tricksy
//
//  Created by Eric Ziegler on 10/30/22.
//

import SwiftUI

struct MenuView: View {
    @Environment(\.dismiss) private var dismiss
    
    var viewModel = MenuViewModel()
    
    var body: some View {
        NavigationStack {
            List (viewModel.menuItems) { menuItem in
                HStack {
                    Image(systemName: menuItem.icon)
                        .foregroundColor(Color(menuItem.displayColor))
                        .font(.title2)
                    Text(menuItem.displayText)
                        .foregroundColor(Color(menuItem.displayColor))
                }
                .listRowBackground(Color.appDark)
                .onTapGesture {
                    dismiss()
                }
            }
            .navigationTitle("Options")
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(Color.black, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .scrollContentBackground(.hidden)
            .background(Color.black)
        }
        .presentationDetents([.medium, .fraction(0.34)])
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
