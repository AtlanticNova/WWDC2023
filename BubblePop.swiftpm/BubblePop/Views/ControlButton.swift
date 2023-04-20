//
//  SwiftUIView.swift
//  BubblePop
//
//  Created by Martinus Andika Novanawa on 19/04/23.
//

import SwiftUI

struct ControlButtonView: View {
    var systemName: String = "play"
    var fontSize: CGFloat = 36
    var color: Color = .white
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: systemName)
                .font(.system(size: fontSize))
                .foregroundColor(color)
        }
    }
}

struct ControlButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ControlButtonView(action: {})
            .preferredColorScheme(.dark)
    }
}
