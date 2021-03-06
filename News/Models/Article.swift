//
//  Headline.swift
//  News
//
//  Created by Nataly on 02.07.2021.
//

import Foundation

struct Article: Decodable {
    let title: String?
    let description: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
}

struct News: Decodable {
    let articles: [Article]
}
