//
//  MainViewController.swift
//  News
//
//  Created by Nataly on 02.07.2021.
//

import UIKit

class MainViewController: UITableViewController {
    
    var news: [Article] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkManager.shared.getNews { news in
            self.news = news
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ArticleCell
        
        let new = news[indexPath.row]
        
        cell.configureCell(with: new)
        
        if let stackView = cell.contentView.viewWithTag(1) as? UIStackView {
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 16).isActive = true
            stackView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: (-16)).isActive = true
            stackView.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 8).isActive = true
            stackView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: (-8)).isActive = true
        }
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let cell = sender as? ArticleCell {
            guard let index = tableView.indexPath(for: cell) else { return }
            tableView.deselectRow(at: index, animated: true)
            let new = news[index.row]
            let detailVC = segue.destination as? DetailViewController
            detailVC?.new = new
        }
    }
}
