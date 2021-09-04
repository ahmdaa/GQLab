//
//  SearchResult.swift
//  GQLab
//
//  Created by Ahmed Abdalla on 9/2/21.
//

import Foundation

class ResultArray: Codable {
    var count = 0                   // Number of results
    var next: String? = ""          // Link to next page
    var previous: String? = ""      // Link to previous page
    var results = [SearchResult]()  // Array of result objects
}

class SearchResult: Codable, CustomStringConvertible {
    var gameSlug: String = ""
    var gameName: String = ""
    var gameCoverImage: String? = ""
    
    enum CodingKeys: String, CodingKey {
        case gameSlug = "slug"
        case gameName = "name"
        case gameCoverImage = "background_image"
    }
    
    // Describe result object
    var description: String {
        return "Game: \(gameName)"
    }
}
