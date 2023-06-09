//
//  BooksApp.swift
//  Books
//
//  Created by Ruslan Alekyan on 04.05.2023.
//

import SwiftUI

@main
struct BooksApp: App {
    @StateObject private var library = Library()                    // Может переместить в MainView
    @StateObject private var authors = Authors()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(library)
                .environmentObject(authors)
        }
    }
}
