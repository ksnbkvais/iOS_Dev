//
//  myTableViewCell.swift
//  movieCollection
//
//  Created by Aisulu Kasenbekova on 14.11.2024.
//

import UIKit

class myTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var descLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!

    
    
    static let identifier = "myTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "myTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with movie: Movie) {
        titleLabel.text = movie.title
        genreLabel.text = movie.genre
        descLabel.text = movie.description
        yearLabel.text = movie.releaseYear
        
        if let urlString = movie.posterUrl, let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async {
                    self.posterImageView.image = UIImage(data: data)
                }
            }.resume()
        }}
    
}
