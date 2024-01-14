//
//  StoryViewModel.swift
//  Stories
//
//  Created by Arshad Mustafa on 05/01/2024.
//

import Foundation

final class StoryViewModel: ObservableObject {
    @Published private(set) var stories: [Story]
    
    init(stories: [Story]) {
        self.stories = stories
    }
}

struct Story: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let duration: TimeInterval
    let track: String
    let image: String
    
    static let data = [
        Story(title: "Bed Time", description: "Bed Time", duration: 70, track: "story1", image: "Image"),
        Story(title: "Every Cloud has a Silver", description: "Every Cloud has a Silver", duration: 120, track: "story2", image: "Image"),
        Story(title: "Kids Bed Time", description: "Kids Bed Time", duration: 90, track: "story3", image: "Image"),
        Story(title: "Megical Blanket", description: "Megical Blanket", duration: 150, track: "story4", image: "Image"),
        Story(title: "Pippins Pillow", description: "Pippins Pillow", duration: 150, track: "story5", image: "Image"),
        Story(title: "The Lil Seeds", description: "The Lil Seeds", duration: 150, track: "story6", image: "Image"),
        Story(title: "The Moonlit", description: "The Moonlit", duration: 150, track: "story7", image: "Image"),
        Story(title: "The Rainbow Song", description: "The Rainbow Song", duration: 150, track: "story8", image: "Image"),
        Story(title: "The Sleepy Lil Star", description: "The Sleepy Lil Star", duration: 150, track: "story9", image: "Image"),
        Story(title: "The Ugly Tree", description: "The Ugly Tree", duration: 150, track: "story10", image: "Image")
        
    ]
}
