//
//  HapticsManager.swift
//  Tricksy
//
//  Created by Eric Ziegler on 10/30/22.
//

import Foundation
import AVFoundation

class HapticsManager {

    static func lightHaptic() {
        AudioServicesPlaySystemSound(1519)
    }
    
    static func strongHaptic() {
        AudioServicesPlayAlertSound(UInt32(kSystemSoundID_Vibrate))
    }
    
}
