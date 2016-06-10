//
//  ListMovieTableViewController.swift
//  MovieSearch
//
//  Created by Patrick Pahl on 6/10/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class ListMovieTableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var movieSearchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var searchMovieResults = [Movie]()
 
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        guard let searchTerm = searchBar.text else {
            return
        }
        
        searchBar.resignFirstResponder()
        
        MovieController.getMovie(searchTerm) { (movies) in
            self.searchMovieResults = movies
            dispatch_async(dispatch_get_main_queue(), {
                
               self.tableView.reloadData()
            })
        }
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return self.searchMovieResults.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("movieCell", forIndexPath: indexPath)

        let movie = self.searchMovieResults[indexPath.row]
        cell.textLabel?.text = movie.title
        cell.detailTextLabel?.text  = "Movie Rating \(movie.vote_average)"
        
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
        if segue.identifier == "toDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            let movie = searchMovieResults[indexPath.row]
            guard let detailVC = segue.destinationViewController as? DetailViewController else {
                 return}
            detailVC.movie = movie
            }
        }
    }




