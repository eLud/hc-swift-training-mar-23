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

    @ObservedObject var library: Library

    @Environment(\.dismiss) var dismiss

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
            CustomToggle(monBool: $scratched)
            Section {
                Button("Create vinyl", action: createVinyl)
            }
        }
    }

    private func createVinyl() {
        let newVinyl = Vinyl(albumName: title, artist: artist, releaseDate: releaseDate, numberInSerie: nil, titles: [], scratched: scratched, speed: speed)
        library.add(newVinyl)
        dismiss()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(library: Library())
    }
}

struct CustomToggle: View {

    @Binding var monBool: Bool

    var body: some View {
        Rectangle()
            .frame(width: 70, height: 30)
            .foregroundColor(backgroundColor)
            .overlay(alignment: monBool ? .trailing : .leading) {
                Rectangle()
                    .frame(width: 26, height: 26)
                    .padding(.horizontal, 4)
            }
            .animation(.spring(), value: monBool)
            .onTapGesture {
                withAnimation {
                    monBool.toggle()
                }
            }
    }

    private var backgroundColor: Color {
        if monBool {
            return Color.green
        } else {
            return Color.gray
        }
    }
}
