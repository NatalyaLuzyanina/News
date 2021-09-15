//
//  ViewModel.swift
//  News
//
//  Created by Nataly on 09.09.2021.
//

import Foundation

protocol ViewModelType {
    func fetchNews(completion: @escaping () -> ())
    func numberOfRows() -> Int
    func viewModelCell(forIndexPath indexpath: IndexPath) -> ViewModelCellType?
}

class ViewModel: NSObject, ViewModelType {
    
    @IBOutlet weak var networkManager: NetworkManager!
    private var news: [Article]?
    
    func fetchNews(completion: @escaping () -> ()) {
        networkManager.getNews { [weak self] news in
            self?.news = news
            completion()
        }
    }
    
    func numberOfRows() -> Int {
        guard let news = news else { return 0 }
        return news.count
    }
    
    func viewModelCell(forIndexPath indexpath: IndexPath) -> ViewModelCellType? {
        guard let article = news?[indexpath.row] else { return nil }
        return ViewModelCell(article: article)
            
    }
}
