//
//  ContentView.swift
//  Stories
//
//  Created by Arshad Mustafa on 05/01/2024.
//

import SwiftUI

@available(iOS 14.0, *)
struct ContentView: View {
    let storyVM = StoryViewModel(stories: Story.data)
    @StateObject private var audioManager = AudioManager()
    var body: some View {
        NavigationView {
            ZStack {
                ZStack {
                    VStack {
                        Image ("circle.rambo")
                        Spacer()
                        Text("Fairy Tale")
                            .font(.custom(Font.bold, size: 48))
                            .foregroundColor(.white)
                            .frame(height: 260, alignment:.top)
                        HStack(spacing:-30) {
                            Image ("rambo")
                            Spacer()
                        }
                    }
                    VStack{
                        NavigationLink(destination: HomeView(storyVM: storyVM).environmentObject(audioManager)) {
                            HStack(spacing: 80) {
                                Image("tick")
                                Text("Let's go")
                                    .font(.system(size: 16))
                                    .foregroundColor(.white)
                                    .bold()
                                Image("arrow")
                            }
                        }
                        .frame(width: 343,height: 72)
                        .background(Color(hex: "FF1563"))
                        .cornerRadius(30)
                    }
                    .frame(height: 520, alignment:.bottom)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: "07CAFF"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 14.0, *) {
            ContentView()
        } else {
            // Fallback on earlier versions
        }
    }
}
