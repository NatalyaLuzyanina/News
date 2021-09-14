//
//  DetailViewController.swift
//  News
//
//  Created by Nataly on 02.07.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: ArticleImageView!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    
    var detailViewModel: ViewModelCellType!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = detailViewModel.title
        contentLabel.text = detailViewModel.description
        
        guard let data = detailViewModel?.image else { return }
        imageView.image = UIImage(data: data)
    }
}
