//
//  ViewController.swift
//  Heroes10
//
//  Created by Aisulu Kasenbekova on 03.12.2024.
//

import UIKit
import 

struct Heroes: Codable {
    let id: Int
    let name: String
    let powerstats: Powerstats
    let biography: Biography
    let images: Images
}

struct Powerstats: Codable {
    let intelligence: Int
    let strength: Int
    let speed: Int
}

struct Biography: Codable {
    let fullName: String
}

struct Images: Codable {
    let md: String?
}



class ViewController: UIViewController {
//    var superheroes: Heroes?
    var superheroes: [Heroes] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/all.json"
        loadDataFromURL(from: url)
    }

    private func loadDataFromURL(from url: String){
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return
        }
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data, error == nil else{
                print("there's error")
                return
            }
            
            do{
                self.superheroes = try JSONDecoder().decode([Heroes].self, from: data)
//                if let firstHero = self.superheroes.first {
//                    print("First Hero ID: \(firstHero.id)")
//                    print("First Hero Full Name: \(firstHero.biography.fullName)")
//                }
                
                
            }catch{
                print("erroorrr with json decode \(error.localizedDescription)")
                return
            }
        }).resume()
    }
    
    @IBOutlet weak var imageHeroView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var intellLabel: UILabel!
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    
    
    private func displayHeroesConf(){
        guard let randomHero = superheroes.randomElement() else {
            print("no heroes")
            return
        }
        nameLabel.text = randomHero.name
        fullNameLabel.text = randomHero.biography.fullName
        intellLabel.text = "Intellegence: \(randomHero.powerstats.intelligence)"
        strengthLabel.text = "Strength: \(randomHero.powerstats.strength)"
        speedLabel.text = "Speed: \(randomHero.powerstats.speed)"
        
        
        
        if let url = randomHero.images.md, let url = URL(string: url)  {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else{
                    print("error with image load")
                    return
                }
                DispatchQueue.main.async {
                    self.imageHeroView.image = UIImage(data: data)
                }}.resume()
        }
            
        }
        
    
    
    @IBAction func randomHeroButtonTapped(_ sender: Any) {
        displayHeroesConf()
    }
    
}

