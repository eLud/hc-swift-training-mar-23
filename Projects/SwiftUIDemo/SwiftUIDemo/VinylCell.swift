//
//  VinylCell.swift
//  SwiftUIDemo
//
//  Created by Ludovic Ollagnier on 10/03/2023.
//

import SwiftUI

struct VinylCell: View {
    let vinyl: Vinyl

    var body: some View {
        HStack {
            Image(systemName: "opticaldisc.fill")
                .foregroundColor(Color("Bluetiful"))
            VStack(alignment: .leading) {
                Text(vinyl.albumName)
                    .foregroundColor(.primary)
                if !vinyl.artist.isEmpty {
                    Text(vinyl.artist)
                        .foregroundColor(.secondary)
                        .font(.caption2)
                }
            }
        }
    }
}

struct VinylCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VinylCell(vinyl: Vinyl(albumName: "TYDEHHDCKEHCKEHKEJ", artist: "fvfvf", releaseDate: Date(), numberInSerie: nil, titles: [], scratched: true, speed: .rpm33))
            VinylCell(vinyl: Vinyl(albumName: "vrfvfv", artist: "", releaseDate: Date(), numberInSerie: nil, titles: [], scratched: false, speed: .rpm33))
                .preferredColorScheme(.dark)

        }
    }
}
