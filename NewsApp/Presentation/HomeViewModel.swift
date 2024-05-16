//
//  HomeViewModel.swift
//  NewsApp
//
//  Created by Gabriel Santiago on 15/05/24.
//

import Foundation


class HomeViewModel {
    
    weak var delegate: ModelUpdateDelegate?
    
    var topHeadlines: [Article] = [] {
        didSet {
            delegate?.update()
        }
    }
    
    func getTopHeadlines() {
        APIServices().getTopHeadlines(from: "br") {topHeadlines in
            self.topHeadlines = topHeadlines.articles
        }
    }    
}
