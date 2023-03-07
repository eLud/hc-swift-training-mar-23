import Foundation

struct Vinyl: Equatable {

    // Raw value
    enum Speed: Int {
        case rpm33 = 33
        case rpm45 = 45
        case rpm78 = 78
    }

    let albumName: String
    let artist: String
    let releaseDate: Date
    let numberInSerie: Int!
    let titles: [String]
    var scratched: Bool
    let speed: Speed

    // Computed property (get-only)
    var age: Double {
        releaseDate.timeIntervalSinceNow
    }

    var age2: Bool {
        get {
            if scratched {
                return false
            } else {
                return true
            }
        }
        set {
            newValue // New value provided by the developer
//            releaseDate =
        }
    }

    func play() {
//        guard !scratched else { return }
//        guard releaseDate < Date() else { return }
        guard let title = titles.first,
                        releaseDate < Date(),
                        !scratched else { return }
        print(title)
    }

// Commented because I rely on the automatic synthesis
//    static func == (lhs: Vinyl, rhs: Vinyl) -> Bool {
//        lhs.albumName == rhs.albumName &&
//        lhs.artist == rhs.artist &&
//        lhs.numberInSerie == rhs.numberInSerie
//    }
}

class Library {

    private(set) var vinyls: [Vinyl]

    init(vinyls: [Vinyl] = []) {
        self.vinyls = vinyls
//        self.vinyls = []
//        let vinyls = [Vinyl]()
//        let vinyls2: [Vinyl] = []
//        self.vinyls = Array<Vinyl>()
    }

//    func list() -> [Vinyl] {
//        vinyls
//    }

    func add(_ vinyl: Vinyl) {
        vinyls.append(vinyl)
    }

    func remove(_ vinyl: Vinyl) {
        let index: Optional<Int> = vinyls.firstIndex(of: vinyl)

        // Naive check
        if index != nil {
            vinyls.remove(at: index!)
        }

        // Works for every swift version
        if let unwrappedIndex = index {
            vinyls.remove(at: unwrappedIndex)
        }

        // Same as above, but shorter and only for newer Swift version
        if let index {
            vinyls.remove(at: index)
        }

        guard let index2 = vinyls.firstIndex(of: vinyl) else { return }
        vinyls.remove(at: index2)
    }
}

let lib = Library()
print(lib.vinyls)

//Cannot use mutating member on immutable value: 'vinyls' setter is inaccessible
//lib.vinyls.remove(at: 6)

let trs33 = Vinyl.Speed.rpm33
let int = trs33.rawValue

guard let trs45 = Vinyl.Speed(rawValue: 45) else { fatalError() }
