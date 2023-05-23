//
//  AuthorView.swift
//  Books
//
//  Created by Ruslan Alekyan on 23.05.2023.
//

import SwiftUI

struct AuthorView: View {
    let author: Author
    
    var body: some View {
        Color.clear
            .navigationTitle(author.name)
    }
}

struct AuthorView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorView(author: Authors.defaultAuthors[0])
    }
}
