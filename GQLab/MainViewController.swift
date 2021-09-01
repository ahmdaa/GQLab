//
//  MainViewController.swift
//  GQLab
//
//  Created by Ahmed Abdalla on 8/30/21.
//

import UIKit

class MainViewController: UIViewController {
    
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
        print("The search text is: '\(searchBar.text!)'")
    }
}

// MARK: - Table View Delegate
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

