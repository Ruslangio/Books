//
//  MainView.swift
//  Books
//
//  Created by Ruslan Alekyan on 17.05.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            LibraryView()
                .tabItem {
                    Label("Library", systemImage: "books.vertical.fill")
                }
            Text("Authors View")                                               // Временно
                .tabItem {
                    Label("Authors", systemImage: "person.3.sequence")
                }
            Text("Search View")
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
