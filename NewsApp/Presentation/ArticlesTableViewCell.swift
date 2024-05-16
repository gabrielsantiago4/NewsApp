//
//  ArticlesTableViewCell.swift
//  NewsApp
//
//  Created by Gabriel Santiago on 15/05/24.
//

import UIKit

class ArticlesTableViewCell: UITableViewCell {
        
    var articleTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    var articleImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 4
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    var articleDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .systemGray
        return label
    }()
    
    var articleAuthor: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with article: Article) {
        
        self.articleTitle.text = article.title
        
        if let unwrappedUrl = article.urlToImage {
            self.articleImage.loadRemoteImage(url: unwrappedUrl)
        } else {
        }
        
        if let unwrappedDescription = article.description {
            self.articleDescription.text = unwrappedDescription
        } else {
        }
        
        if let unwrappedAuthor = article.author {
            self.articleAuthor.text = "- \(unwrappedAuthor)"
        } else {
        }
    }
}
extension ArticlesTableViewCell: ViewCodingProtocol {
    func setupHierarchy() {
        addSubview(articleTitle)
        addSubview(articleImage)
        addSubview(articleDescription)
        addSubview(articleAuthor)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            articleTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: FrameConstants.screenWidth * 0.04),
            articleTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: FrameConstants.screenWidth * -0.04),
            articleTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: FrameConstants.screenHeight * 0.02),
            
            articleImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: FrameConstants.screenWidth * 0.04),
            articleImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: FrameConstants.screenWidth * -0.04),
            articleImage.topAnchor.constraint(equalTo: articleTitle.bottomAnchor, constant: FrameConstants.screenHeight * 0.015),
            articleImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.36),
            
            articleDescription.topAnchor.constraint(equalTo: articleImage.bottomAnchor, constant: FrameConstants.screenHeight * 0.01),
            articleDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: FrameConstants.screenWidth * 0.04),
            articleDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: FrameConstants.screenWidth * -0.04),
            
            articleAuthor.leadingAnchor.constraint(equalTo: leadingAnchor, constant: FrameConstants.screenWidth * 0.04),
            articleAuthor.trailingAnchor.constraint(equalTo: trailingAnchor, constant: FrameConstants.screenWidth * -0.04),
            articleAuthor.topAnchor.constraint(equalTo: articleDescription.bottomAnchor, constant: FrameConstants.screenHeight * 0.023), 
        ])
    }
    
    func addConfigurations() {
        //
    }
}
