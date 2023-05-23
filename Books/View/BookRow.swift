//
//  BookRow.swift
//  Books
//
//  Created by Ruslan Alekyan on 04.05.2023.
//

import SwiftUI

struct BookRow: View {
    var book: Book
    
    var body: some View {
        HStack(spacing: 0) {
            Image("Image")                          // Изменить
                .resizable()
                .scaledToFit()
            
            VStack(alignment: .leading) {
                Text(book.title)
                    .font(.headline)
                Text(book.author)
                    .font(.subheadline)
                Spacer()
                HStack {
                    Text(book.year)
                    Spacer()
                    Text(book.country)
                }
                .font(.caption)
            }
            .padding(.leading, 7)                                       // Чересчур конкретно
        }
        .frame(maxHeight: 80)                                           // Возможно надо изменить
    }
}

struct BookRow_Previews: PreviewProvider {
    static var previews: some View {
        BookRow(book: Library().books[0])
    }
}
