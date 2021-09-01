//
//  MainViewController.swift
//  GQLab
//
//  Created by Ahmed Abdalla on 8/30/21.
//

import UIKit

class MainViewController: UIViewController {
    
    var searchResults = [String]()
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        searchResults = []
        for i in 0...2 {
            searchResults.append(
                String(
                    format: "Fake Result %d for '%@'", i, searchBar.text!
                )
            )
        }
        tableView.reloadData()
    }
}

// MARK: - Table View Delegate
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "SearchResultCell"
        
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        
        cell.textLabel!.text = searchResults[indexPath.row]
        return cell
    }
    
}

