//
//  Library.swift
//  Books
//
//  Created by Ruslan Alekyan on 04.05.2023.
//

import SwiftUI

class Library: ObservableObject {
    static var defaultBooks = [                                                                                                  // Временно
        Book(title: "Игра престолов", author: "Джордж Р.Р. Мартин", year: "1996", country: "США"),
        Book(title: "Бойцовский клуб", author: "Чак Паланик", year: "1996", country: "США"),
        Book(title: "Скотный двор", author: "Джордж Оруэлл", year: "1945", country: "Великобритания"),
        Book(title: "Битва королей", author: "Джордж Р.Р. Мартин", year: "1998", country: "США"),
        Book(title: "Свидание с Рамой", author: "Артур Кларк", year: "1973", country: "Великобритания"),
        Book(title: "Всадник без головы", author: "Майн Рид", year: "1865", country: "Великобритания")
    ]
    
    @Published private(set) var books = defaultBooks {
        didSet {
            storeInUserDefaults()
        }
    }
    
    init() {
        restoreFromUserDefaults()
    }
    
    // MARK: - Save & Load
                                                                                        // Может изменить способ сохранения
    private let booksKey = "books"
    
    private func storeInUserDefaults() {
        if let encodedBooks = try? JSONEncoder().encode(books) {
            UserDefaults.standard.set(encodedBooks, forKey: booksKey)
        }
    }
    
    private func restoreFromUserDefaults() {
        if let encodedBooks = UserDefaults.standard.data(forKey: booksKey) {
            let decodedBooks = try? JSONDecoder().decode([Book].self, from: encodedBooks)
            books = decodedBooks ?? []
        }
        if books.isEmpty { books = Library.defaultBooks }                               // Временно
    }
    
    // MARK: - Sorting
    
    enum SortOptions: String, CaseIterable {
        case none = "Default"
        case title, author, year, country
    }
    
    @Published var sorting = SortOptions.none
    
    var sortedBooks: [Book] {
        switch sorting {
        case .none:
            return books
        case .title:
            return books.sorted(by: { $0.title < $1.title })
        case .author:
            return books.sorted(by: { $0.author < $1.author })
        case .year:
            return books.sorted(by: { $0.year < $1.year })
        case .country:
            return books.sorted(by: { $0.country < $1.country })
        }
    }
    
    // MARK: - Intent(s)
    
    func addBook(title: String, author: String, year: String, country: String) {
        let book = Book(title: title, author: author, year: year, country: country)
        books.append(book)
    }
    
    func deleteBook(at indexSet: IndexSet) {
        books.remove(atOffsets: indexSet)
    }
    
    func moveBook(fromOffsets: IndexSet, toOffset: Int) {                           // Поменять названия входных данных
        books.move(fromOffsets: fromOffsets, toOffset: toOffset)
    }
    
    func toggleReading(of book: Book) {                                // Поменять название      Да и вообще пересмотреть функцию
        if let index = books.firstIndex(where: { $0 == book }) {
            books[index].isRead.toggle()
        }
    }
}
