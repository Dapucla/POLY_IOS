//
//  model.swift
//  HW_2
//
//  Created by Даниил Алексеев on 06.10.2021.
//

import Foundation


struct Author: Codable{
    var resultCount: Int?
    var results: [Results]
}

struct Results: Codable {
    var artistName: String?
    var collectionName: String?
    var trackName: String?
    var collectionCensoredName: String?
    var artistViewUrl: String?
    var artworkUrl100: String?
}
