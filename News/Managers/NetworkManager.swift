//
//  NetworkManager.swift
//  News
//
//  Created by Nataly on 03.07.2021.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    func getNews(completion: @escaping ([Article]) -> Void) {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=285f568edbcc47e08b0886a32a0935d3") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let data = try JSONDecoder().decode(News.self, from: data)
                let news = data.articles
                completion(news)
            } catch let error {
                print(error)
            }
        }.resume()
    }
}

