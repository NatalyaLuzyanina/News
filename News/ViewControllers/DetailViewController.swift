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
    var new: Article!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = new.title
        imageView.fetchImage(url: new.urlToImage ?? "")
        contentLabel.text = new.content
    }
}
