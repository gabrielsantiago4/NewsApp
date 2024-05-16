//
//  ViewController.swift
//  NewsApp
//
//  Created by Gabriel Santiago on 13/05/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    let homeView = HomeView()
    
    var viewModel =  HomeViewModel()
    
    override func loadView() {
        super.loadView()
        view = homeView
        homeView.articlesTableView.delegate = self
        homeView.articlesTableView.dataSource = self
        viewModel.delegate = self
        viewModel.getTopHeadlines()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.topHeadlines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let topArticles = viewModel.topHeadlines[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticlesTableViewCell") as! ArticlesTableViewCell
        cell.labelTest.text = topArticles.title
        return cell
    }
}
extension HomeViewController: ModelUpdateDelegate {
    func update() {
        DispatchQueue.main.async {
            self.homeView.articlesTableView.reloadData()
        }
    }
}


