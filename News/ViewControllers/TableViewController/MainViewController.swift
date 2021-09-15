//
//  MainViewController.swift
//  News
//
//  Created by Nataly on 02.07.2021.
//

import UIKit

class MainViewController: UITableViewController {
   
    @IBOutlet var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.fetchNews {
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ArticleCell
        
        let cellViewModel = viewModel.viewModelCell(forIndexPath: indexPath)
        
        cell.viewModelCell = cellViewModel
        
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
            let detailViewModel = viewModel.viewModelCell(forIndexPath: index)
            let detailVC = segue.destination as? DetailViewController
            detailVC?.detailViewModel = detailViewModel
        }
    }
}
