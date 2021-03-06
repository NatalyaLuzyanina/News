//
//  ArticleImageView.swift
//  News
//
//  Created by Nataly on 04.07.2021.
//

import UIKit

class ArticleImageView: UIImageView {
    
    func fetchImage(url: String) {
        guard let url = URL(string: url) else {
            image = UIImage(named: "noImage")
            return
        }
        
        if let cashedImage = getCashedImage(from: url) {
            image = cashedImage
            return
        }
        
        ImageManager.shared.fetchImage(url: url) { (data, response) in
            self.image = UIImage(data: data)
            self.saveDataToCache(with: data, and: response)
        }
    }
    
    //метод сохранения в кеш
    private func saveDataToCache(with data: Data, and response: URLResponse) {
        guard let url = response.url else { return }
        let request = URLRequest(url: url)
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: request)
    }
    
    // метод поиска картинки в кеше
    private func getCashedImage(from url: URL) -> UIImage? {
        let request = URLRequest(url: url)
        if let cachedResponse = URLCache.shared.cachedResponse(for: request) {
            return UIImage(data: cachedResponse.data)
        }
        return nil
    }
}
