//
//  BookView.swift
//  Books
//
//  Created by Ruslan Alekyan on 04.05.2023.
//

import SwiftUI

struct BookView: View {
    var book: Book
    
    var body: some View {                                       // Изменить
        ScrollView {
            Image("Image")
                .resizable()
                .scaledToFit()
            HStack {
                VStack(alignment: .leading) {
                    Text("Title")
                    Text("Author")
                    Text("Year")
                    Text("Country")
                }
                VStack(alignment: .leading) {
                    Text(book.title)
                    Text(book.author)
                    Text(book.year)
                    Text(book.country)
                }
            }
        }
            .navigationTitle(book.title)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView(book: Library().books[0])
    }
}
