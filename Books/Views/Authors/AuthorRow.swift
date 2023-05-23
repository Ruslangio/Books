//
//  AuthorRow.swift
//  Books
//
//  Created by Ruslan Alekyan on 23.05.2023.
//

import SwiftUI

struct AuthorRow: View {
    let author: Author
    
    var body: some View {
        HStack {
            Rectangle()                                             // Временно вместо изображения
                .aspectRatio(2/3, contentMode: .fit)
            VStack(alignment: .leading) {
                Text(author.name)
                    .font(.headline)
                if let originalName = author.originalName {                     // Возможно создать отдельный OptionalText
                    Text(originalName)
                        .font(.subheadline)
                }
                Spacer()
                Text(author.country)
                
            }
        }
        .frame(maxHeight: 80)                                           // Возможно надо изменить
    }
}

struct AuthorRow_Previews: PreviewProvider {
    static var previews: some View {
        AuthorRow(author: Authors.defaultAuthors[0])
    }
}
