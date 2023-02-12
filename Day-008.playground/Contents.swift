import Cocoa

func printTimesTables(for number: Int, end: Int = 10) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)
printTimesTables(for: 8)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
//characters.removeAll()
characters.removeAll(keepingCapacity: true)
print(characters.count)

enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch {
    print("There was an error.")
}


do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}

// checkpoint 4
enum SquareRootError: Error {
    case outOfBounds, noRoot
}
func squareRoot(number: Int) throws -> Int {
    if (number > 1_000 || number < 1) {
        throw SquareRootError.outOfBounds
    }
    
    for gess in 1...number / 2 {
        if (gess * gess == number) {
            return gess
        }
    }
    
    throw SquareRootError.noRoot
}

do {
    let response = try squareRoot(number: 25)
    print(response)
} catch SquareRootError.outOfBounds {
    print("out of bounds")
} catch SquareRootError.noRoot {
    print("no root")
} catch {
    print("some error")
}
