//
//  ButtonComponents.swift
//  Tricksy
//
//  Created by Eric Ziegler on 10/30/22.
//

import SwiftUI

// MARK: - Action Button

struct ActionButton: View {
    
    var actionText: String?
    var onTap: (() -> Void)?
    
    init(actionText: String?, onTap: (() -> Void)?) {
        self.actionText = actionText
        self.onTap = onTap
    }
    
    var body: some View {
        Button {
            onTap?()
        } label: {
            Text(actionText ?? "")
        }
        .font(.creepsterFont(size: 36))
        .foregroundColor(.white)
        .padding()
        .frame(width: 300, alignment: .center)
        .background(RoundedRectangle(cornerRadius: 16, style:   .circular).fill(Color.appMain))
        .padding(.bottom, 8)

    }
    
}

struct ButtonComponents_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            ActionButton(actionText: "Action", onTap: nil)
        }        
    }
}
