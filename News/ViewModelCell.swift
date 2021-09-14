//
//  ViewModelCell.swift
//  News
//
//  Created by Nataly on 09.09.2021.
//

import Foundation

protocol ViewModelCellType: AnyObject {
    var title: String { get }
    var description: String { get }
    var image: Data? { get }
    var date: String { get }

}

class ViewModelCell: ViewModelCellType {
    private var article: Article
    
    var image: Data? {
        let url = URL(string: article.urlToImage ?? "")
        guard let imageData = ImageManager.shared.fetchImageData(from: url) else { return nil }
        return imageData
    }
    
    var title: String {
        return article.title ?? ""
    }
    
    var description: String {
        return article.description ?? ""
    }
    
    var date: String {
        return dateFormatter(from: article.publishedAt ?? "")
    }
    
    init(article: Article) {
        self.article = article
    }
    
    private func dateFormatter(from string: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = dateFormatter.date(from: string) else { return "" }
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        let datePublished = dateFormatter.string(from: date)
        return datePublished
    }
    
}
//extension Date {
//   func getFormattedDate(format: String) -> String {
//        let dateformat = DateFormatter()
//        dateformat.dateFormat = format
//        return dateformat.string(from: self)
//    }
//}
