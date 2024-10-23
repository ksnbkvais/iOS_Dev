//
//  ViewController.swift
//  eggg
//
//  Created by Aisulu Kasenbekova on 23.10.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var soft: UIImageView!
    
    @IBOutlet weak var medium: UIImageView!
    
    @IBOutlet weak var hard: UIImageView!
    
    @IBOutlet weak var progress: UIProgressView!
    
    
    @IBOutlet weak var timer: UILabel!
    
    var time = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let softTapGesture = UITapGestureRecognizer(target: self, action: #selector(eggTapped))
        soft.addGestureRecognizer(softTapGesture)
        soft.isUserInteractionEnabled = true
        
        let mediumTapGesture = UITapGestureRecognizer(target: self, action: #selector(eggTapped))
        medium.addGestureRecognizer(mediumTapGesture)
        medium.isUserInteractionEnabled = true
        
        let hardTapGesture = UITapGestureRecognizer(target: self, action: #selector(eggTapped))
        hard.addGestureRecognizer(hardTapGesture)
        hard.isUserInteractionEnabled = true
        
        progress.progress = 0.0
    }
    
    @objc func eggTapped(_ sender: UITapGestureRecognizer) {
        if sender.view == soft {
            startTimer(for: "Soft")
        } else if sender.view == medium {
            startTimer(for: "Medium")
        } else if sender.view == hard {
            startTimer(for: "Hard")
        }
    }
    
    func startTimer(for eggType: String) {
            time.invalidate()
            secondsPassed = 0
            progress.progress = 0.0
            
            totalTime = eggTimes[eggType] ?? 0
            timer.text = "\(totalTime / 60):00"
            
            time = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    @objc func updateTimer() {
            if secondsPassed < totalTime {
                secondsPassed += 1
                progress.progress = Float(secondsPassed) / Float(totalTime)
                
                let minutes = (totalTime - secondsPassed) / 60
                let seconds = (totalTime - secondsPassed) % 60
                timer.text = String(format: "%02d:%02d", minutes, seconds)
                
            } else {
                time.invalidate()
                playAlarm()
                timer.text = "Time's Up!"
            }
        }
        
        func playAlarm() {
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try? AVAudioPlayer(contentsOf: url!)
            player?.play()
        }
}

