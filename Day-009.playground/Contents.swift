import Cocoa

// CLOSURE
let sayHello1 = {
    print("Hi there!")
}

sayHello1()


let sayHello2 = { (name: String) in
    print("Hi \(name)!")
}
sayHello2("you")

let sayHello3 = { (name: String) -> String in
    "Hi \(name)!"
}
print(sayHello3("me"))

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})
print(team.sorted())
print(captainFirstTeam)


// trailing closures and shorthand syntax

//let captainFirstTeam = team.sorted(by: { name1, name2 in

// the lack of parenthesis here is called trailing closure syntax
let captainFirstTeam2 = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}
print(captainFirstTeam2)

// adding shorthand syntax it will look like this
let captainFirstTeam3 = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }

    return $0 < $1
}
print(captainFirstTeam3)

// usefull in simple cases like
let reverseTeam = team.sorted { $0 > $1 }

//functions as parameters
func makeArray(size: Int = 10, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}
let rolls = makeArray {
    Int.random(in: 1...20)
}

print(rolls)

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void={}) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}
doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
}


// Checkpoint 5
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
luckyNumbers.filter { !$0.isMultiple(of: 2) }.sorted().map {
    print("\($0) is a lucky number")
}
