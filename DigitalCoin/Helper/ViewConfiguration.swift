//
//  ViewConfiguration.swift
//  MVC-Example
//
//  Created by Artur Fortunato on 12/01/21.
//

protocol ViewConfiguration: class {
    func buildViewHierarchy()
    func setupConstraints()
    func configureViews()
    func setupViewConfiguration()
}

extension ViewConfiguration {
    func setupViewConfiguration() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
    func configureViews() { }
}
