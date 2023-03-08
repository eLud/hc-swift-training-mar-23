//
//  Library.swift
//  Vinyl Library
//
//  Created by Ludovic Ollagnier on 07/03/2023.
//

import Foundation

class Library {

    var vinyls: [Vinyl] = []

    func add(_ vinyl: Vinyl) {
        vinyls.append(vinyl)
    }

    func remove(_ vinyl: Vinyl) -> Vinyl? {
        if let index = vinyls.firstIndex(of: vinyl) {
            return vinyls.remove(at: index)
        }
        return nil
    }
}

extension Library: Equatable {
    static func == (lhs: Library, rhs: Library) -> Bool {
        lhs.vinyls == rhs.vinyls
    }
}
