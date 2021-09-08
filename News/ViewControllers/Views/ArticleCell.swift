//
//  ArticleCell.swift
//  News
//
//  Created by Nataly on 02.07.2021.
//

import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var imageViewCell: ArticleImageView!
    @IBOutlet var dateLabel: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        self.isHighlighted = selected ? true : false
    }
    
    func configureCell(with article: Article) {
       
        titleLabel.text = article.title
        descriptionLabel.text = article.description
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: article.publishedAt ?? "")
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        let datePublished = dateFormatter.string(from: date!)

        dateLabel.text = datePublished
        
        imageViewCell.fetchImage(url: article.urlToImage ?? "")
        }
    }
 
extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
