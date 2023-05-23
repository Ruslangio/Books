//
//  Book.swift
//  Books
//
//  Created by Ruslan Alekyan on 04.05.2023.
//

import Foundation

struct Book: Identifiable, Hashable, Codable {
    var id = UUID()                     // Возможно надо изменить
    let title: String
    let author: String
    let year: String
    let country: String
}
