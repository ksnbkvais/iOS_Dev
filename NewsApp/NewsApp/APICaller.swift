//
//  APICaller.swift
//  NewApp
//
//  Created by Student on 27.02.2024.
//

import Foundation

//final class APICaller {
//    static let shared = APICaller()
//
//    struct Constants {
//        static let topHeadlinesURL = URL(string:"https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=09d79462d1dd441c88343137f064799c")
//    }
//
//    private init() {}
//
//    public func getTopStories(completion: @escaping (Result<[String], Error>) -> Void) {
//        guard let url = Constants.topHeadlinesURL else {
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) { data, , error in
//            if let error = error {
//                completion(.failure(<#T##Error#>))
//            }
//            else if let data = data {
//                do {
//                    let result = try JSONDecoder().decode(APIresponse.self, from: <#T##Data#>)
//
//                    print("Articles: \(result.articles.count)")
//                }
//                catch {
//                    completion(.failure(<#T##Error#>))
//                }
//            }
//        }
//        task.resume()
//    }
//}

final class APICaller {
    static let shared = APICaller()

    struct Constants {
        static let topHeadlinesURL = URL(string:"https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=09d79462d1dd441c88343137f064799c")
    }

    private init() {}

    public func getTopStories(completion: @escaping (Result<[Article], Error>) -> Void) {
        guard let url = Constants.topHeadlinesURL else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    completion(.success(result.articles))
                    print("Articles: \(result.articles.count)")
                    completion(.success(result.articles))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}

struct APIResponse: Codable {
    let articles : [Article]
}

struct Article: Codable {
    let source: Source
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
}

struct Source: Codable {
    let name: String
}
