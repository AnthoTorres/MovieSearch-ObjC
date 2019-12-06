//
//  JATMovieListTableViewController.swift
//  MovieHybrid
//
//  Created by Anthony Torres on 12/6/19.
//  Copyright © 2019 Anthony Torres. All rights reserved.
//

import UIKit

class JATMovieListTableViewController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var movies = [JATMovie] () {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = searchController
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? JATMovieTableViewCell else { fatalError("Could not deqeue cell") }
        
        let movie = movies[indexPath.row];
        cell.movie = movie;
        
        return cell
    }
}

extension JATMovieListTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text
            else { return }
        
        JATMovieController.fetchMovie(withSearchTerm: searchTerm) { movies in
            guard let movies = movies
                else { return }
            
            DispatchQueue.main.async {
                self.movies = movies
            }
        }
    }
}
