import Foundation

let languageName = "Swift"

//languageName = "ObjC"
// Cannot assign to value: 'languageName' is a 'let' constant

var version = 5.7
//Cannot assign value of type 'String' to type 'Double'
//version = languageName

let introduced = 2014
//Cannot assign value of type 'Int' to type 'Double'
//version = introduced

let version2: Float = 5.8
//Cannot assign value of type 'Float' to type 'Double'
//version = version2

let a = 5
let b = 2
let c = Double(a) / Double(b)

languageName.count
let reversed = String(languageName.reversed())
reversed.uppercased()

introduced.isMultiple(of: 2)

print("La version de " + languageName + " est \(version)")

//: #Arrays

var mixedArray: [Any] = [version, version2, a, languageName]
var cities = ["Rennes", "Nantes", "Paris"] // Le mieux
var cities2: Array<String> = ["Rennes", "Nantes", "Paris"] // Le dernier
var cities3: [String] // Le medium

cities3 = []

cities3.append("Rennes")
cities3.append(contentsOf: ["Nantes", "Paris"])
cities3.joined(separator: " ")
cities3.insert("Nantes", at: 0)
cities3.count

cities3[1]

let filtred = cities3.filter { (element: String) -> Bool in
    element.count <= 6
}

let uppercased = cities3.map { element in
    element.uppercased()
}

//: #Dictionaries
var nbHabitants =
["Paris": 2250000, "Bordeaux": 239000, "Lyon": 491268, "Marseille": 850636]

var nbHabitants2: [String: Int] =
["Paris": 2250000, "Bordeaux": 239000, "Lyon": 491268, "Marseille": 850636]

var nbHabitants3: Dictionary<String, Int> =
["Paris": 2250000, "Bordeaux": 239000, "Lyon": 491268, "Marseille": 850636]

nbHabitants["Paris"] = 2250001
nbHabitants["Rennes"] = 215366

//: #Set
var wishes = Set<String>()
wishes.insert("Nantes")
wishes.insert("Nantes")
wishes.insert("Rennes")
wishes.count
wishes
var visited: Set = ["Bordeaux","Lyon","Marseille"]

wishes.contains("Paris")
wishes.union(visited)


func repete(_ repetition: UInt, trucARepeter: @escaping () -> Void) {
    for _ in 0..<repetition {
        Task {
            trucARepeter()
        }
    }
    print("Fini")
}

repete(5) {
    print("toto")
}

func loadEquipment(periodId: Int) async -> (equipment: [String], erroCode: Int) {
    await Task {

    }

    return (["", ""], 0)
}

//_loadEquipments(5, completion: { (equipment, error) in
//    _loadEquipments(5, completion: { (equipment, error) in
//        _loadEquipments(5, completion: { (equipment, error) in
//            print(equipment)
//        })
//    })
//})

let result = await loadEquipment(periodId: 5)
result.equipment
