//
//  Vinyl.swift
//  Vinyl Library
//
//  Created by Ludovic Ollagnier on 07/03/2023.
//

import Foundation

struct Vinyl: Equatable, MusicHolder, Identifiable, Codable {
    enum Speed: Int, CaseIterable, Codable {
        case rpm33 = 33
        case rpm45 = 45
        case rpm78 = 78

        static var toutLescases: [Speed] {
            [rpm33, rpm45, rpm78]
        }

        var title: String {
            return "\(rawValue)trs"
        }
    }

    let albumName: String
    let artist: String
    let releaseDate: Date
    let numberInSerie: Int?
    let titles: [String]
    var scratched: Bool
    let speed: Speed

    let id = UUID()
}

extension Vinyl.Speed: Identifiable {
    var id: Vinyl.Speed {
        self
    }
}
