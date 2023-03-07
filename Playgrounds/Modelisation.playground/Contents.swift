struct Dog {
    let name: String
    var age: Int
}

class Animal {
    let name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    convenience init(name: String) {
        self.init(name: name, age: 0)
    }
}

class Cat: Animal {

    static let initialNumberOfLives = 9

    fileprivate var elapsedLives: Int

    override internal init(name: String, age: Int) {
        self.elapsedLives = Cat.computeElapsedLives(currentAge: age)
        super.init(name: name, age: age)
    }

    static func computeElapsedLives(currentAge: Int) -> Int {
        return max(initialNumberOfLives - currentAge, 0)
    }
}

//Memberwise init
var medor = Dog(name: "Médor", age: 0)
var medor2 = medor // Copier la valeur de medor dans medor2

medor.age = 1

medor.age
medor2.age

let felix = Cat(name: "Félix", age: 1)
felix.age = 1
//felix.name = "Félix"
let felix2 = felix
felix.age = 2

felix.age
felix2.age
felix.elapsedLives

let felix3 = Cat(name: "Félix 3")
felix3.age = 2

felix === felix2
felix === felix3

func learn(language: String, time: Int) {
    print("I love \(language) \(time) times more than C#")
}

func learn(_ langue: String, time: Int) {
    print("I love \(langue) \(time) times more than C#")
}

// 1
func learn(language: String = "Swift", time: Int) -> String {
    return "I love \(language) \(time) times more than C#"
}

// 2
func learn(time: Double) -> String {
    return "I love \(time) times more than C#"
}

learn(time: 5.0)
learn("Swift", time: 5)

func multiply(_ firstNumber: Int, by multiplier: Int = 1, andAdd constant: Int = 0) -> Int {
    (firstNumber * multiplier) + constant
}

multiply(5, by: 12, andAdd: 50)
