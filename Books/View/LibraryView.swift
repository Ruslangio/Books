//
//  LibraryView.swift
//  Books
//
//  Created by Ruslan Alekyan on 04.05.2023.


import SwiftUI

struct LibraryView: View {
    @EnvironmentObject var library: Library
    @State private var isShowingAddBookSheet = false
        
    var body: some View {
        NavigationStack {
            List {
                ForEach(library.sortedBooks) { book in
                    NavigationLink {                                    // Возможно надо изменить
                        BookView(book: book)
                    } label: {
                        BookRow(book: book)
                    }
                }
                .onDelete(perform: library.deleteBook)
                .onMove(perform: library.moveBook)
            }
            .navigationTitle("Books")
            .toolbar {
                ToolbarItemGroup {
                    addBookButton
                    menu
                }
            }
            .sheet(isPresented: $isShowingAddBookSheet) {
                AddBookSheet()
            }
        }
    }
    
    private var addBookButton: some View {
        Button {
            isShowingAddBookSheet = true
        } label: {
            Image(systemName: "plus")
        }
    }
    
    private var menu: some View {
        Menu {
            Menu {
                Picker("Sorting", selection: $library.sorting) {
                    ForEach(Library.SortOptions.allCases, id: \.self) {
                        Text("\($0.rawValue.capitalized)")
                    }
                }
            } label: {
                Label("Sort by", systemImage: "arrow.up.arrow.down")
            }
            Menu {
                Button("Doesn't work", action: {})
            } label: {
                Label("Filter", systemImage: "slider.horizontal.3")
            }
        } label: {
            Image(systemName: "ellipsis.circle")
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
