//
//  News.swift
//  NewsApp
//
//  Created by Gabriel Santiago on 13/05/24.
//

import Foundation

struct Article: Codable {
    var title: String
    var author: String?
}

struct TopHeadlines: Codable {
    var articles: [Article]
}
