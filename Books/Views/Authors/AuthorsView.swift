//
//  AuthorsView.swift
//  Books
//
//  Created by Ruslan Alekyan on 23.05.2023.
//

import SwiftUI

struct AuthorsView: View {
    @EnvironmentObject var authors: Authors
    @State private var isShowingAddAuthorSheet = false
    
    var body: some View {
        NavigationStack {
            List(authors.authors) { author in
                NavigationLink {
                    AuthorView(author: author)
                } label: {
                    AuthorRow(author: author)
                }
            }
            .navigationTitle("Authors")
            .toolbar {
                Button {
                    isShowingAddAuthorSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $isShowingAddAuthorSheet) {
                AddAuthorSheet()
            }
        }
    }
}

struct AuthorsView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorsView()
    }
}
