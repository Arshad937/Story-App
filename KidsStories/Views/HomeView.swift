//
//  HomeView.swift
//  Stories
//
//  Created by Arshad Mustafa on 05/01/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var storyVM: StoryViewModel
    @StateObject var audioManager = AudioManager()
    var text : String = "Bed Time Stories"
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                ScrollView {
                    VStack {
                        Image("doll")
                        Text(text)
                            .font(.custom(Font.bold, size: 20))
                            .foregroundColor(.white)
                        Divider()
                            .frame(width: 263, height: 1)
                            .overlay(.white)
                        
                        VStack {
                            NavigationLink(destination: PlayerView(storyVM: storyVM, selectedStory: Story.data[0])) {
                                StoryView(title: "Bed Time", time: "2:29", imageName: "story1")
                                    .environmentObject(audioManager)
                            }
                            Divider()
                                .frame(width: 198, height: 1)
                                .overlay(.white)
                            NavigationLink(destination: PlayerView(storyVM: storyVM, selectedStory: Story.data[1])) {
                                StoryView(title: "Every Cloud has a Silver", time: "1:14", imageName: "story2")
                            }
                            Divider()
                                .frame(width: 198, height: 1)
                                .overlay(.white)
                            
                            NavigationLink(destination: PlayerView(storyVM: storyVM, selectedStory: Story.data[2])) {
                                StoryView(title: "Kids Bed Time", time: "1:42", imageName: "story3")
                                    
                            }
                            Divider()
                                .frame(width: 198, height: 1)
                                .overlay(.white)
                            
                            NavigationLink(destination: PlayerView(storyVM: storyVM, selectedStory: Story.data[3])) {
                                StoryView(title: "Megical Blanket", time: "2:15", imageName: "story4")
                            }
                            Divider()
                                .frame(width: 198, height: 1)
                                .overlay(.white)
                            
                            NavigationLink(destination: PlayerView(storyVM: storyVM, selectedStory: Story.data[4])) {
                                StoryView(title: "Pippins Pillow", time: "3:14", imageName: "story5")
                            }
                            Divider()
                                .frame(width: 198, height: 1)
                                .overlay(.white)
                            
                            NavigationLink(destination: PlayerView(storyVM: storyVM, selectedStory: Story.data[5])) {
                                StoryView(title: "The Lil Seed", time: "1:01", imageName: "story6")
                            }
                            Divider()
                                .frame(width: 198, height: 1)
                                .overlay(.white)
                            
                            NavigationLink(destination: PlayerView(storyVM: storyVM, selectedStory: Story.data[6])) {
                                StoryView(title: "The Moonlit", time: "5:20", imageName: "story7")
                            }
                            Divider()
                                .frame(width: 198, height: 1)
                                .overlay(.white)
                            
                            NavigationLink(destination: PlayerView(storyVM: storyVM, selectedStory: Story.data[7])) {
                                StoryView(title: "The Rainbow Song", time: "2:38", imageName: "story8")
                            }
                            Divider()
                                .frame(width: 198, height: 1)
                                .overlay(.white)
                            
                            NavigationLink(destination: PlayerView(storyVM: storyVM, selectedStory: Story.data[8])) {
                                StoryView(title: "The Sleepy Lil Star", time: "2:37", imageName: "story9")
                            }
                            Divider()
                                .frame(width: 198, height: 1)
                                .overlay(.white)
                            
                            NavigationLink(destination: PlayerView(storyVM: storyVM, selectedStory: Story.data[9])) {
                                StoryView(title: "The Ugly Tree", time: "1:15", imageName: "story10")
                            }
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct HomeView_Previews: PreviewProvider {
    static let storyVM = StoryViewModel(stories: Story.data)
    static var previews: some View {
        HomeView(storyVM: storyVM)
            .environmentObject(AudioManager())
    }
}
