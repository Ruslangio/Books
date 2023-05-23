//
//  Author.swift
//  Books
//
//  Created by Ruslan Alekyan on 23.05.2023.
//

import Foundation

struct Author: Identifiable {
    let id = UUID()
    let name: String
    let originalName: String?
    let dateOfBirth: Date?
    let dateOfDeath: Date?
    let country: String
    var books: [Book]
    
    init(name: String, originalName: String? = nil, dateOfBirth: Date? = nil, dateOfDeath: Date? = nil, country: String) {
        self.name = name
        self.originalName = originalName
        self.dateOfBirth = dateOfBirth
        self.dateOfDeath = dateOfDeath
        self.country = country
        books = []
    }
}
