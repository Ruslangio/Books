//
//  AddBookSheet.swift
//  Books
//
//  Created by Ruslan Alekyan on 04.05.2023.
//

import SwiftUI

struct AddBookSheet: View {
    @EnvironmentObject var library: Library
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                titleSection
                authorSection
                yearSection
                countrySection
            }
            .navigationTitle("Add book")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    cancelButton
                }
                ToolbarItem {
                   addButton
                }
            }
        }
    }
    
    // MARK: - Sections
    
    @State private var title = ""
    @State private var author = ""
    @State private var year = ""
    @State private var country = ""
    
    private var titleSection: some View {
        Section("Title") {
            TextField("Title", text: $title)
        }
    }
    
    private var authorSection: some View {
        Section("Author") {
            TextField("Author", text: $author)
        }
    }
    
    private var yearSection: some View {
        Section("Year") {
            TextField("Year", text: $year)
                .keyboardType(.numberPad)
        }
    }
    
    private var countrySection: some View {
        Section("Country") {
            TextField("Country", text: $country)
        }
    }
    
    // MARK: - Toolbar Buttons
    
    private var cancelButton: some View {
        Button("Cancel") {
            dismiss()
        }
    }
    
    private var addButton: some View {
        Button("Add") {
            library.addBook(title: title, author: author, year: year, country: country)
            dismiss()
        }
        .disabled(title == "" || author == "" || year == "" || country == "")
    }
}

struct AddBookSheet_Previews: PreviewProvider {
    static var previews: some View {
        AddBookSheet()
    }
}
