//
//  SearchResultsTableViewController.swift
//  Timeline-Work
//
//  Created by Thorsten Boldin on 17/10/2016.
//  Copyright © 2016 Thorsten Boldin. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController {

    weak var delegate: UISearchControllerDelegate?
 
    public var resultsArray: [SearchableRecord] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    // MARK: - Table view data source

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return resultsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostTableViewCell else {
            return UITableViewCell()
        }
        let result = resultsArray[indexPath.row]
        cell.updateWithPost(post: result as! Post, index: indexPath)
        return cell
    }
    

}

extension SearchResultsTableViewController: UISearchControllerDelegate {
    func updateResultsArray(results: [SearchableRecord]) {
//        guard let myResultsArray = self.results as SearchableRecord else { return }
//        self.resultsArray = myResultsArray as? [Post]
//        self.tableView.reloadData()
    }
}


