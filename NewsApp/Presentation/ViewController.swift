//
//  ViewController.swift
//  NewsApp
//
//  Created by Gabriel Santiago on 13/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        APIServices().getTopHeadlines(from:"br") { article in
            print(article.articles.count)
        }
    }


}

