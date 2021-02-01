//
//  Bindable.swift
//  MVC-Example
//
//  Created by Marcio Fetter on 12/01/21.
//

import Foundation

public class Bindable<T> {
    public typealias Listener = (T) -> Void
    // MARK: - Properties
    var listeners: [Listener] = []
    // MARK: - Constructors
    public init(_ val: T) {
        self.value = val
    }
    // MARK: - Bind
    public func bind(_ listerner: @escaping Listener) {
        self.listeners.append(listerner)
    }
    public var value: T {
        didSet {
            listeners.forEach { $0(value) }
        }
    }
}
