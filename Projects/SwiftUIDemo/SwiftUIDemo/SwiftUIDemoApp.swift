//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by Ludovic Ollagnier on 09/03/2023.
//

import SwiftUI

@main
struct SwiftUIDemoApp: App {

    @StateObject var library = Library()

    var body: some Scene {
        WindowGroup {
            TabView {
                VinylListView(library: library)
                    .tabItem {
                        Text("List")
                        Image(systemName: "list.bullet")
                    }
                Text("Vinyl Out")
                    .tabItem {
                        Text("Out")
                        Image(systemName: "square.and.arrow.up")
                    }
                NetworkView()
                    .tabItem {
                        Text("Network")
                        Image(systemName: "network")
                    }
            }
        }
    }
}
