//
//  MusicHolder.swift
//  Vinyl Library
//
//  Created by Ludovic Ollagnier on 08/03/2023.
//

import Foundation

protocol MusicHolder {

    var albumName: String { get }
    var scratched: Bool { get set }
    var titles: [String] { get }

    func play()
}

extension MusicHolder {
    func play() {
        guard let firstTitle = titles.first else { return }
        print(firstTitle)
    }
}
