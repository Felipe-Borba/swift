import Cocoa

protocol Wheel {
    var wheelNumber: Int { get }
}
protocol Vehicle {
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}
// um protocol e como uma interface e pode um protocol "herdar" outro e ter multiplos "herdamentos"
struct Car: Vehicle, Wheel {
    var wheelNumber: Int = 4;
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}

// opaque return type
func getRandomNumber_old() -> Int {
    Int.random(in: 1...6)
}

func getRandomBool_old() -> Bool {
    Bool.random()
}
print(getRandomNumber_old() == getRandomNumber_old())

func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}
print(getRandomNumber() == getRandomNumber())

// extentions
extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() {
        self = self.trimmed()
    }
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}
var quote = "   The truth is rarely pure and never simple   "

print(quote.trimmed())
let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines)

//keep default initializer
struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}
extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}
let book1 = Book(title: "s", pageCount: 2, readingHours: 1)
let book2 = Book(title: "a", pageCount: 1)


protocol Person { // like an interface
    var name: String { get }
    //func sayHello()
}
extension Person { // kind add random functionality in my protocol or add default implementation
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}
struct Employee: Person {
    let name: String
}
let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()

// Checkpoint 8
protocol Building {
    var rooms: Int { get }
    var cost: Int { get }
    var estateAgentName:String { get }
    
    func SalesSumary()
}
struct House: Building {
    var rooms: Int
    
    var cost: Int
    
    var estateAgentName: String
    
    func SalesSumary() {
        print("what?")
    }
}
struct Office: Building {
    var rooms: Int
    
    var cost: Int
    
    var estateAgentName: String
    
    func SalesSumary() {
        print("many sales")
    }
}
