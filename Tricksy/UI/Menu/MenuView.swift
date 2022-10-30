//
//  MenuView.swift
//  Tricksy
//
//  Created by Eric Ziegler on 10/30/22.
//

import SwiftUI

struct MenuView: View {
    
    private var viewModel = MenuViewModel()
    
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
                    print("\(menuItem.displayText)")
                }
            }
            .padding()
            .navigationTitle("Tricksy")
            .toolbar {
                Button {
                    print("CLOSE")
                } label: {
                    Image(systemName: "xmark")
                }
                .padding(.all, 16)
            }
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(Color.black, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .scrollContentBackground(.hidden)
            .background(Color.black)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
