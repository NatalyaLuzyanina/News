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
    @IBOutlet var imageViewCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(with article: Article) {
       
        titleLabel.text = article.title
        descriptionLabel.text = article.description
        
        guard let stringUrl = article.urlToImage else { return }
        guard let url = URL(string: stringUrl) else { return }
        
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                self.imageViewCell.image = UIImage(data: imageData)
            }
        }
        
        
        
    }
    
    

}
