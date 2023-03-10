//
//  VinylListView.swift
//  SwiftUIDemo
//
//  Created by Ludovic Ollagnier on 09/03/2023.
//

import SwiftUI

struct VinylListView: View {

    @ObservedObject var library: Library
    @State private var showForm = false

    var body: some View {
        NavigationView {
            List {
                TextField("", text: .constant(""))
                buttonSection
                vinylSection
            }
            .sheet(isPresented: $showForm, content: {
                ContentView(library: library)
            })
            .navigationTitle("Vinyl list")
            .toolbar {
                ToolbarItem {
                    Button {
//                        showForm = !showForm
                        showForm.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }

    private var buttonSection: some View {
        Section {
            Text("You have \(library.vinyls.count) vinyls")
            Button("Add") {
                library.add(Vinyl(albumName: "Bla", artist: "Bla", releaseDate: Date(), numberInSerie: nil, titles: [], scratched: true, speed: .rpm45))
            }
        }
    }
    private var vinylSection: some View {
        Section {
            ForEach(library.vinyls) { vinyl in
                NavigationLink(destination: Text(vinyl.albumName)) {
                    VinylCell(vinyl: vinyl)
                }
            }
            .onDelete { indexSet in
                library.vinyls.remove(atOffsets: indexSet)
            }
            .onMove { indexSet, offset in
                library.vinyls.move(fromOffsets: indexSet, toOffset: offset)
            }
        }
    }
}

struct VinylListView_Previews: PreviewProvider {
    static var previews: some View {
        VinylListView(library: Library())
    }
}
