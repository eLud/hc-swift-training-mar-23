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
            VinylListView(library: library)
        }
    }
}
