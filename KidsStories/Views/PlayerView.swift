//
//  PlayerView.swift
//  Stories
//
//  Created by Arshad Mustafa on 05/01/2024.
//

import SwiftUI

@available(iOS 15.0, *)
struct PlayerView: View {
    @EnvironmentObject var audioManager: AudioManager
    var storyVM: StoryViewModel
    var selectedStory: Story
    var isPreview: Bool = false
    @State private var value: Double = 0.0
    @State private var isEditing: Bool = false
    @Environment(\.dismiss) var dismiss
    
    let timer = Timer
        .publish(every: 0.5, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack {
            BackgroundView()
            Image(selectedStory.image)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Button {
                        audioManager.stop()
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 36))
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                Spacer()
                Text(audioManager.currentStory?.title ?? "")
                    .font(.custom(Font.bold, size: 40))
                    .foregroundColor(.white)
                
                if let player = audioManager.player {
                    VStack {
                        Image("music logo")
                        Spacer()
                        HStack {
                            let color: Color = audioManager.isLooping ? .teal : .white
                            //                        ControlButtonView(systemName: "repeat", color: color) {
                            //                            audioManager.toggleLoop()
                            //                        }
                            //                        Spacer()
                            //
                            //
                            //
                            //                        ControlButtonView(systemName: "gobackward.10") {
                            //                            player.currentTime -= 10
                            //                        }
                            //                            Spacer()
                            
                            // MARK: Previous Button
                            ControlButtonView(systemName:"prev") {
                                audioManager.playPrevious()
                            }
                            //                            Spacer()
                            
                            ControlButtonView(systemName: audioManager.isPlaying  ? "pause" : "play") {
                                audioManager.playPause()
                            }
                            .padding(.bottom,60)
                            //                            Spacer()
                            // MARK: Next Button
                            ControlButtonView(systemName:"next") {
                                audioManager.playNext()
                            }
                            //                            Spacer()
                            //
                            //                        ControlButtonView(systemName: "goforward.10") {
                            //                            player.currentTime += 10
                            //                        }
                            //                        Spacer()
                            //
                            //                        ControlButtonView(systemName: "stop.fill") {
                            //                            audioManager.stop()
                            //                        }
                        }
                        .frame(width: 248, height: 113)
                        
                        Image("music")
                        Slider(value: $value, in: 0...player.duration) { editing in
                            isEditing = editing
                            if !editing {
                                player.currentTime = value
                            }
                        }
                        .accentColor(Color(hex: "#FEC4EA"))
                        
                        HStack {
                            Text(DateComponentsFormatter.positional.string(from: player.currentTime) ?? "0:00")
                            
                            Spacer()
                            
                            Text(DateComponentsFormatter.positional.string(from: player.duration - player.currentTime) ?? "0:00")
                        }
                        .foregroundColor(.white)
                    }
                }
            }
            .padding(20)
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            audioManager.startPlayer(track: selectedStory.track, isPreview: isPreview)
        }
        .onReceive(timer) { _ in
            guard let player = audioManager.player, !isEditing else { return }
            value = player.currentTime
        }
        .navigationBarBackButtonHidden()
    }
}

struct PlayerView_Previews: PreviewProvider {
    static let storyVM = StoryViewModel(stories: Story.data)
    static var previews: some View {
        let audioManager = AudioManager()
        audioManager.startPlayer(track: Story.data[0].track, isPreview: true)
        
        #if canImport(UIKit)
        if #available(iOS 15.0, *) {
            return PlayerView(storyVM: storyVM, selectedStory: Story.data[0], isPreview: true)
                .environmentObject(audioManager)
        } else {
            return AnyView(Text("Preview not available on iOS versions earlier than 15"))
        }
        #endif
    }
}
