//
//  ViewController.swift
//  xylo
//
//  Created by Aisulu Kasenbekova on 15.10.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audio : AVAudioPlayer!
    
    let notes = ["A", "B", "C", "D", "E", "F","G" ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    //    @IBAction func playMusic(_ sender: Any) {
    //        var sound = notes[(sender.tag)-1]
    //        playSound(press: sound)
    //    }
    
    
    @IBAction func playMusic(_ sender: UIButton) {
        let sound = notes[sender.tag-1]
        playSound(press: sound)
//        animate(for: sender)
    }
    
    
    
    
    func playSound(press: String){
        guard let soundURL = Bundle.main.url(forResource: press, withExtension: "wav", subdirectory: "Sounds") else {
            print("Error: Could not find \(press).wav")
            return
        }
        
        do {
            audio = try AVAudioPlayer(contentsOf: soundURL)
            audio?.prepareToPlay()
            audio?.play()
        } catch {
            print("Error")
        }
        
        
        
    }
    
//    func animate(for button: UIButton) {
//        guard let buttonColor = button.backgroundColor else { return }
//
//        UIView.animate(withDuration: 1.0, animations: {
//            self.view.backgroundColor = buttonColor
//        }) { _ in
//            UIView.animate(withDuration: 1.0, delay: 0.5, options: [], animations: {
//                self.view.backgroundColor = .systemBackground
//            }, completion: nil)
//        }
//    }
    
}
