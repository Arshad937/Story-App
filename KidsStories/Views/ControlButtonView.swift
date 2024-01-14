//
//  ControlButtonView.swift
//  Stories
//
//  Created by Arshad Mustafa on 05/01/2024.
//

import SwiftUI

struct ControlButtonView: View {
    var systemName: String = "play"
    var fontSize: CGFloat = 24
    var color: Color = .white
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName)
                .foregroundColor(color)
        }
    }
}

struct PlaybackControlButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ControlButtonView(systemName: "play", fontSize: 24, color: .white) {
            
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
