//
//  Home.swift
//  NewsApp
//
//  Created by Gabriel Santiago on 15/05/24.
//

import UIKit

class HomeView: UIView {
    
    lazy var articlesTableView: UITableView = {
        var tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ArticlesTableViewCell.self, forCellReuseIdentifier: "ArticlesTableViewCell")
        tableView.rowHeight = FrameConstants.screenHeight * 0.089
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        buildView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension HomeView: ViewCodingProtocol {
    func setupHierarchy() {
        addSubview(articlesTableView)
        
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            articlesTableView.topAnchor.constraint(equalTo: topAnchor),
            articlesTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            articlesTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            articlesTableView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    func addConfigurations() {
        backgroundColor = .blue
    }
}
