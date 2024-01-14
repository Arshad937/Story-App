//
//  SongView.swift
//  Stories
//
//  Created by Arshad Mustafa on 08/01/2024.
//

import SwiftUI

struct StoryView: View {
    @EnvironmentObject var audioManager: AudioManager
    var title: String
    var time: String
    var imageName: String
    var body: some View {
        var text : String = "Bed Time Stories"
        ZStack {
            BackgroundView()
            HStack(spacing:32) {
                Image(imageName)
                Text(" \(title)\n \(text)")
                Text(time)
            }
            .foregroundColor(.white)
            .font(.custom(Font.regular, size: 20))
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(title: "Stories", time: "0:00", imageName: "story1")
    }
}
