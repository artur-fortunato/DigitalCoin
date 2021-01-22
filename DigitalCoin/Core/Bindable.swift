//
//  Bindable.swift
//  MVC-Example
//
//  Created by Marcio Fetter on 12/01/21.
//

import Foundation

public class Bindable<T> {
    
    typealias Listener = (T) -> Void
    
    // MARK: - Properties
    var listeners: [Listener] = []
    
    // MARK: - Constructors
    init(_ v: T) {
        self.value = v
    }
    
    // MARK: - Bind
    func bind(_ listerner: @escaping Listener) {
        self.listeners.append(listerner)
    }
    
    var value: T {
        didSet {
            listeners.forEach { $0(value) }
        }
    }
}
