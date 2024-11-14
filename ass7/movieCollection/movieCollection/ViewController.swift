//
//  ViewController.swift
//  movieCollection
//
//  Created by Aisulu Kasenbekova on 14.11.2024.
//

import UIKit
import Foundation
struct Movie: Decodable {
    let title: String
    let genre: String
    let description: String
    let releaseYear: String
    let posterUrl: String?
}


class ViewController: UIViewController {
    var movies: [Movie] = []
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "myTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "myTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        loadmovies()
    }
    
    func loadmovies(){
        guard let url = Bundle.main.url(forResource: "movies", withExtension: "json") else {
            print("error witg json file")
            return
        }
        do{
            let data = try Data(contentsOf: url)
            movies = try JSONDecoder().decode([Movie].self, from: data)
            tableView.reloadData()
        }catch{
            print("error")
        }
        
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped me")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myTableViewCell", for: indexPath) as! myTableViewCell
        let movie = movies[indexPath.row]
        cell.configure(with: movie)
        return cell
    }
}

