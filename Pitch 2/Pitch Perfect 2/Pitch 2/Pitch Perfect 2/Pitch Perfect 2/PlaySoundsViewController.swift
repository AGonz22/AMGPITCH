//
//  PlaySoundsViewController.swift
//  Pitch Perfect 2
//
//  Created by Andres Gonzalez on 6/15/17.
//  Copyright © 2017 Andres Gonzalez. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var SnailButton: UIButton!
    @IBOutlet weak var ChipmunkButton: UIButton!
    @IBOutlet weak var RabbitButton: UIButton!
    @IBOutlet weak var DarthVaderButton: UIButton!
    @IBOutlet weak var EchoButton: UIButton!
    @IBOutlet weak var ReverbButton: UIButton!
    @IBOutlet weak var StopButton: UIButton!
    
    var recordedAudioURL: URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb}
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
    switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
    }

    @IBAction func stopButtonPressed(_ sender: AnyObject) {
       stopAudio()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear (animated)
        configureUI(.notPlaying)
    }

}
