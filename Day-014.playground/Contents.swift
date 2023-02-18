import Cocoa

// optional
var username: String? = nil
//var username: String? = "na"

if let unwrappedName = username { // you have to unwrap the optional
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

// applaying shawdoing tecnique
if let username = username {
    print("gotcha \(username)")
}

// unwrap optionals with guard
func printSquare(of number1: Int?) {
    guard let number = number1 else {
        print("Missing input")
        return
    }

    print("\(number) x \(number) is \(number * number)")
}
printSquare(of: nil)
printSquare(of: 19)


let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

// here ?? it's called nil coalescing operator
let new = captains["Serenity"] ?? "errou"
print(new)

let input = ""
let number = Int(input) ?? 0
print(number)

let names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    if id == 23 {
        return "Foi"
    }
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)

func tryFodase() -> String? {
    guard let teste = try? getUser(id: 24) else {
        return nil
    }
    return teste
}

print(tryFodase() ?? "vish")

// checkpoint 9
func getRandom(in array: [Int]?) -> Int{
    guard let array = array else {
        return Array(1...100).randomElement() ?? 0
    }
    
    return array.randomElement() ?? 0
}
getRandom(in: nil)
getRandom(in: Array(1...10))
