//
//  ArticlesTableViewCell.swift
//  NewsApp
//
//  Created by Gabriel Santiago on 15/05/24.
//

import UIKit

class ArticlesTableViewCell: UITableViewCell {
    
    var labelTest: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "TESTANDO"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension ArticlesTableViewCell: ViewCodingProtocol {
    func setupHierarchy() {
        addSubview(labelTest)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            labelTest.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            labelTest.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0)
        ])
    }
    
    func addConfigurations() {
        //
    }
}
