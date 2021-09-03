//
//  MainViewController.swift
//  GQLab
//
//  Created by Ahmed Abdalla on 8/30/21.
//

import UIKit

class MainViewController: UIViewController {
    
    var searchResults = [SearchResult]()
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    var hasSearched = false // Track if the user made a search
    
    struct TableView {
        struct CellIdentifiers {
            static let searchResultCell = "SearchResultCell"
            static let nothingFoundCell = "NothingFoundCell"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register a cell nib for a search result cell
        var cellNib = UINib(nibName: TableView.CellIdentifiers.searchResultCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: TableView.CellIdentifiers.searchResultCell)
        
        // Register a cell nib for an empty cell
        cellNib = UINib(nibName: TableView.CellIdentifiers.nothingFoundCell, bundle: nil)
        tableView.register(
          cellNib,
          forCellReuseIdentifier: TableView.CellIdentifiers.nothingFoundCell)
    }
}

/* MainViewController needs to conform to:
    UISearchBarDelegate
    UITableViewDelegate
    UITableViewDataSource */

// MARK: - Search Bar Delegate
extension MainViewController: UISearchBarDelegate {
    /* UISearchBarDelegate method that is invoked when user taps the search button */
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        // Dismiss keyboard
        searchBar.resignFirstResponder()
        
        // print("The search text is: '\(searchBar.text!)'")
        if searchBar.text! == "None" {
            searchResults.removeAll()
        } else {
            if searchResults.isEmpty {
                for i in 0...2 {
                    let searchResult = SearchResult()
                    searchResult.name = String(format: "Fake Result %d for", i)
                    searchResult.artistName = searchBar.text!
                    searchResults.append(searchResult)
                }
            }
        }
        hasSearched = true // User made a search
        tableView.reloadData()
    }
}

// MARK: - Table View Delegate
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !hasSearched {
            return 0
        } else if searchResults.count == 0 {
            return 1
        } else {
            return searchResults.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // If there are no search results, show nothing found cell
        if searchResults.count == 0 {
            return tableView.dequeueReusableCell(withIdentifier: TableView.CellIdentifiers.nothingFoundCell, for: indexPath)
        // Otherwise show search result cells
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier:TableView.CellIdentifiers.searchResultCell, for: indexPath) as! SearchResultCell
            let searchResult = searchResults[indexPath.row]
            cell.gameNameLabel.text = searchResult.name
            return cell
        }
    }
    
    // Deselect a row when tapping
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Allows row selection only when there are search results
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if searchResults.count == 0 {
            return nil
        } else {
            return indexPath
        }
    }
    
}

