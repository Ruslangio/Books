//
//  Authors.swift
//  Books
//
//  Created by Ruslan Alekyan on 23.05.2023.
//

import SwiftUI

class Authors: ObservableObject {               // Подумать над названием класса
    static var defaultAuthors = [
        Author(name: "Габриэль Гарсиа Маркес", country: "Колумбия"),
        Author(name: "Артур Кларк", country: "Великобритания"),
        Author(name: "Данте Алигьери", originalName: "Dante Alighieri", country: "Италия")
    ]
    
    @Published var authors: [Author]
    
    init() {
        authors = Authors.defaultAuthors
    }
}
