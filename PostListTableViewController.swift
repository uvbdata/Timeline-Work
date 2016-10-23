//
//  PostListTableViewController.swift
//  Timeline-Work
//
//  Created by Thorsten Boldin on 17/10/2016.
//  Copyright © 2016 Thorsten Boldin. All rights reserved.
//

import UIKit
import Foundation

class PostListTableViewController: UITableViewController, UISearchResultsUpdating {

   
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearchController()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PostController.sharedController.posts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostTableViewCell else {
            return UITableViewCell()
        }
        
        let post: Post = PostController.sharedController.posts[indexPath.row]
        cell.updateWithPost(post: post, index: indexPath)
        return cell
    }
    

    
   

    // MARK: - Navigation

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        // Show Detail Information about the Post
        if segue.identifier == "postDetailSegue" {
            
        }
        
        // Create a new Post -> Show addPostVC
        if segue.identifier == "addPostDetailSegue" {
            
            
        }
    }
    
    func setUpSearchController() {
       
        let searchResultsController = UISearchController(searchResultsController: SearchResultsTableViewController())
        searchResultsController.searchResultsUpdater = self
        searchResultsController.dimsBackgroundDuringPresentation = true
        self.definesPresentationContext = true
        tableView.tableHeaderView = searchResultsController.searchBar

    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        NSLog("updateSearchResults")
    
    }
    

}
