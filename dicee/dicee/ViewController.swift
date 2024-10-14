//
//  ViewController.swift
//  dicee
//
//  Created by Aisulu Kasenbekova on 15.10.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    var scoreCount = 0
    var images = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func rollDice(_ sender: Any) {
    
        rollTheDice()

    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
            if motion == .motionShake {
                rollTheDice()
            }
        }
    func rollTheDice(){
        let a = Int.random(in: 0...5)
        let b = Int.random(in: 0...5)
        imageView1.image = UIImage(named: images[a])
        imageView2.image = UIImage(named: images[b])
        scoreCount = a + b + 2
        score.text = "Score: \(scoreCount)"
    }
    
    
}

