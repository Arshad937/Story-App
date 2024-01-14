//
//  AudioManager.swift
//  Stories
//
//  Created by Arshad Mustafa on 05/01/2024.
//

import Foundation
import AVKit

final class AudioManager: ObservableObject {
    var player: AVAudioPlayer?
    private var currentIndex = 0
    @Published private(set) var currentStory: Story?
    @Published private(set) var isPlaying: Bool = false {
        didSet {
            print("isPlaying", isPlaying)
        }
    }
    @Published private(set) var isLooping: Bool = false
    init() {
        // Add an observer to update duration when the player status changes
        NotificationCenter.default.addObserver(
            forName: AVAudioSession.interruptionNotification,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            self?.objectWillChange.send()
        }
    }
    
    func startPlayer(track: String, isPreview: Bool = false) {
        guard let url = Bundle.main.url(forResource: track, withExtension: "mp3") else {
            print("Resource not found \(track)")
            return
        }
        // Retrieve the story corresponding to the track
        guard let story = Story.data.first(where: { $0.track == track }) else {
            print("Story not found for track: \(track)")
            return
        }
        
        // Set currentStory before playing
        currentStory = story
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url)
            if isPreview {
                player?.prepareToPlay()
            } else {
                player?.play()
                isPlaying = true
            }
            
        } catch {
            print("Failed", error)
        }
    }
    
    func playPause() {
        guard let player = player else {
            print("Instance not found")
            return
        }
        
        if player.isPlaying {
            player.pause()
            isPlaying = false
        } else {
            player.play()
            isPlaying = true
        }
    }
    
    func stop() {
        guard let player = player else { return }
        
        if player.isPlaying {
            player.stop()
            isPlaying = false
        }
    }
    
    func toggleLoop() {
        guard let player = player else { return }
        player.numberOfLoops = player.numberOfLoops == 0 ? -1 : 0
        isLooping = player.numberOfLoops != 0
        print("isLooping", isLooping)
    }
    func playNext() {
        currentIndex = (currentIndex + 1) % Story.data.count
        playStory(at: currentIndex)
    }
    
    func playPrevious() {
        currentIndex = (currentIndex - 1 + Story.data.count) % Story.data.count
        playStory(at: currentIndex)
    }
    private func playStory(at index: Int) {
        stop()
        
        let story = Story.data[index]
        startPlayer(track: story.track)
        currentStory = story
    }
}

extension AVAudioPlayer {
    var durationString: String {
        let totalSeconds = Int(self.duration)
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
