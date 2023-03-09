//
//  VinylListView.swift
//  SwiftUIDemo
//
//  Created by Ludovic Ollagnier on 09/03/2023.
//

import SwiftUI

struct VinylListView: View {

    @StateObject var library = Library(demoData: false)

    var body: some View {
        List {
            Section {
                Text("Pooeriv")
                Text("Pooeriv")
                Text("Pooeriv")
                Button("Add") {
                    library.add(Vinyl(albumName: "Bla", artist: "Bla", releaseDate: Date(), numberInSerie: nil, titles: [], scratched: true, speed: .rpm45))
                }
            }
            Section {
                ForEach(library.vinyls) { vinyl in
                    HStack {
                        Image(systemName: "opticaldisc.fill")
                        VStack(alignment: .leading) {
                            Text(vinyl.albumName)
                            Text(vinyl.artist)
                                .foregroundColor(.secondary)
                                .font(.caption2)
                        }
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
}

struct VinylListView_Previews: PreviewProvider {
    static var previews: some View {
        VinylListView()
    }
}
