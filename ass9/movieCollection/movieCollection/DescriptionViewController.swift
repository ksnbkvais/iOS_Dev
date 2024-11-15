//
//  DescriptionViewController.swift
//  movieCollection
//
//  Created by Aisulu Kasenbekova on 15.11.2024.
//

import UIKit

class DescriptionViewController: UIViewController {
    var movie: Movie?
    @IBOutlet var descImage: UIImageView!
    @IBOutlet var descTitleLabel: UILabel!
    @IBOutlet var descGenreLabel: UILabel!
    @IBOutlet var descYearLabel: UILabel!
    @IBOutlet var descDescLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        if let movie = movie{
            descTitleLabel.text = movie.title
            descGenreLabel.text = movie.genre
            descYearLabel.text = movie.releaseYear
            descDescLabel.text = movie.description
            
            if let urlString = movie.posterUrl, let url = URL(string: urlString) {
                URLSession.shared.dataTask(with: url) { data, _, error in
                    guard let data = data, error == nil else { return }
                    DispatchQueue.main.async {
                        self.descImage.image = UIImage(data: data)
                    }
                }.resume()
            }}
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
