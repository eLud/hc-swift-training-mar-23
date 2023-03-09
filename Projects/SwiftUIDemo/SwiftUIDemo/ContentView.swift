//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Ludovic Ollagnier on 09/03/2023.
//

import SwiftUI

struct ContentView: View {

    @State private var speed = Vinyl.Speed.rpm33
    @State private var title = ""
    @State private var artist = ""
    @State private var releaseDate = Date()
    @State private var scratched = false

    let library = Library()

    var body: some View {
        Form {
            Picker("Vinyl's speed", selection: $speed) {
                ForEach(Vinyl.Speed.allCases) { speed in
                    Text(speed.title)
                        .tag(speed)
                }
            }
            Section {
                TextField("Vinyl's title", text: $title)
            }
            TextField("Artist's name", text: $artist)
            DatePicker(selection: $releaseDate, in: ...Date(), displayedComponents: .date) {
                Text("Release date")
            }
            Toggle("Scratched", isOn: $scratched)
            Section {
                Button("Create vinyl", action: createVinyl)
            }
        }
    }

    private func createVinyl() {
        let newVinyl = Vinyl(albumName: title, artist: artist, releaseDate: releaseDate, numberInSerie: nil, titles: [], scratched: scratched, speed: speed)
        library.add(newVinyl)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
