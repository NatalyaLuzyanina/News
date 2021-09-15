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
    
    weak var viewModelCell: ViewModelCellType? {
        willSet(viewModel) {
            titleLabel.text = viewModel?.title
            descriptionLabel.text = viewModel?.description
            dateLabel.text = viewModel?.date
            
            guard let url = viewModel?.image else { return }
            imageViewCell.fetchImage(url: url)
        }
    }
}
 

