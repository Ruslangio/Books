//
//  LibraryView.swift
//  Books
//
//  Created by Ruslan Alekyan on 04.05.2023.


import SwiftUI

struct LibraryView: View {
    @EnvironmentObject var library: Library
    
    @State private var isShowingAddBookSheet = false
    @State private var searchText = ""
        
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink(destination: BookView(book: book)) {                     // Изменить! Используется старая версия
                        BookRow(book: book)
                    }
                    .swipeActions(edge: .leading) {
                        Button {
                            library.toggleReading(of: book)
                        } label: {
                            Image(systemName: "book.circle")                    // Найти подходящую иконку
                        }

                    }
                }
                .onDelete(perform: library.deleteBook)
                .onMove(perform: library.moveBook)
            }
            .navigationTitle("Library")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    addBookButton
                }
                ToolbarItemGroup {
                    sortingButton
                    filterButton
                }
            }
            .sheet(isPresented: $isShowingAddBookSheet) {
                AddBookSheet()
            }
        }
        .searchable(text: $searchText)                                                 // Правильно ли место?
    }
    
    var books: [Book] {
        if searchText.isEmpty {
            return library.sortedBooks
        } else {
            return library.sortedBooks.filter { $0.title.localizedCaseInsensitiveContains(searchText) || $0.author.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    // MARK: - Toolbar buttons
    
    private var addBookButton: some View {
        Button {
            isShowingAddBookSheet = true
        } label: {
            Image(systemName: "plus")
        }
    }
    
    private var sortingButton: some View {
        Menu {
            Picker("Sorting", selection: $library.sorting) {
                ForEach(Library.SortOptions.allCases, id: \.self) {
                    Text("\($0.rawValue.capitalized)")
                }
            }
        } label: {
            Label("Sort by", systemImage: "arrow.up.arrow.down")
        }
    }
    
    private var filterButton: some View {
        Menu {
            Button("Doesn't work", action: {})
        } label: {
            Label("Filter", systemImage: "line.3.horizontal.decrease.circle")                       // Или лучше "slider.horizontal.3"?
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
