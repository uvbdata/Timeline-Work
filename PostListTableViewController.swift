//
//  PostListTableViewController.swift
//  Timeline-Work
//
//  Created by Thorsten Boldin on 17/10/2016.
//  Copyright © 2016 Thorsten Boldin. All rights reserved.
//

import UIKit
import Foundation

class PostListTableViewController: UITableViewController, UISearchResultsUpdating,  PostDetailTableViewControllerDelegate, AddPostTableViewControllerDelegate {

    var searchController: UISearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newSetUpSearchController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PostController.sharedController.posts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostTableViewCell else {
            return UITableViewCell()
        }
        
        let post: Post = PostController.sharedController.posts[indexPath.row]!
        cell.updateWithPost(post: post, index: indexPath)
        return cell
    }

    // MARK: - Navigation

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        // Show Detail Information about the Post
        if segue.identifier == "postDetailSegue" {
            guard let dvc = segue.destination as? PostDetailTableViewController,
                  let postPath = tableView.indexPathForSelectedRow,
                  let myPost = PostController.sharedController.posts[postPath.row]
             else { return }
            dvc.post = myPost
            dvc.delegate = self
            dvc.navigationController?.title = myPost.comment[0].text
        }
        
        // Create a new Post -> Show addPostVC
        if segue.identifier == "addPostDetailSegue" {
            guard let dvc = segue.destination as? AddPostTableViewController
                else { return }
            dvc.delegate = self
        }
    }
    
    func newSetUpSearchController() {
       
        
<<<<<<< HEAD
        let storyboard = SearchResultsTableViewController()
=======
        let storyboard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchTVC") as? SearchResultsTableViewController
>>>>>>> 7899c6fc3d417ce30c1b17c996184e27ef1556f8
        self.searchController = UISearchController(searchResultsController: storyboard)
        searchController?.searchResultsUpdater = self
        searchController?.dimsBackgroundDuringPresentation = true
        self.definesPresentationContext = true
<<<<<<< HEAD
       tableView.tableHeaderView = searchController?.searchBar
=======
//        
        searchController?.searchBar.sizeToFit()
        searchController?.searchBar.searchBarStyle = .default
        tableView.tableHeaderView = searchController?.searchBar
>>>>>>> 7899c6fc3d417ce30c1b17c996184e27ef1556f8

    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        NSLog("updateSearchResults")
    
    }
    
    func PostDetailTableVCDidFinished(controller: PostDetailTableViewController) {
        controller.navigationController?.popViewController(animated: true)
    
    }
    func AddPostTableViewControllerDidFinished(controller: AddPostTableViewController) {
        controller.navigationController?.popViewController(animated: true)
    }

}
