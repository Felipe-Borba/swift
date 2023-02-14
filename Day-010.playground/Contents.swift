import Cocoa

struct Album {
    let title: String
    let artist: String
    let year: Int

    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
//let wings = Album()

print(red.title)
red.printSummary()

struct Employee {
    var vacationRemaining: Double

    mutating func takeVacation(days: Double) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

var emp = Employee(vacationRemaining: 10)
//let emp = Employee(vacationRemaining: 10)
emp.takeVacation(days: 20)
print(emp.vacationRemaining)

struct Employee2 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    //computed type
    var vacationRemaining: Int { // = 50 {
        get {
            vacationAllocated - vacationTaken
        }

        //set {
         //   vacationAllocated = vacationTaken + newValue
        //}
    }
}

var archer = Employee2(name: "Sterling Archer", vacationAllocated: 20, vacationTaken: 10)
archer.vacationTaken += 4
print(archer.vacationRemaining)
//archer.vacationRemaining = 20
print(archer.vacationRemaining)

// observers
struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }

        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")


struct Player {
    let name: String
    let number: Int

    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
}

