//
//  Library.swift
//  Vinyl Library
//
//  Created by Ludovic Ollagnier on 07/03/2023.
//

import Foundation

class Library: ObservableObject {

    @Published var vinyls: [Vinyl]

    init(demoData: Bool = false) {
        self.vinyls = []
        if demoData {
            populateDemoData()
        }
    }

    func add(_ vinyl: Vinyl) {
        vinyls.append(vinyl)
    }

    func remove(_ vinyl: Vinyl) -> Vinyl? {
        if let index = vinyls.firstIndex(of: vinyl) {
            return vinyls.remove(at: index)
        }
        return nil
    }

    func populateDemoData() {
        for i in 0..<100 {
            let v = Vinyl(albumName: "Vinyl \(i)", artist: "Artist Vinyl \(i)", releaseDate: Date(), numberInSerie: nil, titles: [], scratched: i.isMultiple(of: 2), speed: .rpm33)
            add(v)
        }
    }
}

extension Library: Equatable {
    static func == (lhs: Library, rhs: Library) -> Bool {
        lhs.vinyls == rhs.vinyls
    }
}
