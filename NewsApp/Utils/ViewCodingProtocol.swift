//
//  ViewCodingProtocol.swift
//  NewsApp
//
//  Created by Gabriel Santiago on 15/05/24.
//

import Foundation

protocol ViewCodingProtocol {
    func setupHierarchy()
    func configureConstraints()
    func addConfigurations()
}
extension ViewCodingProtocol {
    func buildView() {
        setupHierarchy()
        configureConstraints()
        addConfigurations()
    }
}
    
