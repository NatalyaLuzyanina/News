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
            stackView.topAnchor.constraint(equalTo: cell.contentView.topAnchor).isActive = true
            stackView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor).isActive = true
        }
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let index = tableView.indexPathForSelectedRow?.row else { return }
        let new = news[index]
        let detailVC = segue.destination as? DetailViewController
        detailVC?.new = new
        
    }
    

}
