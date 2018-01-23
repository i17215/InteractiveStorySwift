//
//  Audio.swift
//  InteractiveStory
//
//  Created by Kirill Koleno on 23.02.17.
//  Copyright © 2017 Kirill Koleno. All rights reserved.
//

import Foundation
import AudioToolbox

extension Story {
    var soundEffectName: String {
        switch self {
        case .droid, .home: return "HappyEnding"
        case .monster: return "Ominous"
        default: return "PageTurn"
        }
    }
    
    var soundEffectURL: URL {
        let path = Bundle.main.path(forResource: soundEffectName, ofType: "wav")!
        return URL(fileURLWithPath: path)
    }
}

class SoundEffectsPlayer {
    var sound: SystemSoundID = 0
    
    func playSound(for story: Story) {
        let soundURl = story.soundEffectURL as CFURL
        AudioServicesCreateSystemSoundID(soundURl, &sound)
        AudioServicesPlaySystemSound(sound)
    }
}
