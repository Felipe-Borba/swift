import Cocoa

// Review

// const values
let someText = "something 🥹"
//someText = " " not allowed
someText


func funcao1(titulo:String, onclick: () -> Void) {
    print(titulo)
    onclick()
}

funcao1(titulo: "bbbb") {
    print("cccc")
}

if true {
    print("d")
}

if (true) {
    print("s")
}

// default values
func greet(_ person: String, formal: Bool = false) {
    if formal {
        print("Welcome, \(person)!")
    } else {
        print("Hi, \(person)!")
    }
}
greet("Tim", formal: true)
greet("Taylor")

// Handling errors in functions
// first define the error that can occur
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

    if password.count < 10 {
        return "OK"
    } else {
        return "Good"
    }
}
let string = "12345"

do {
    let result = try checkPassword(string)
    print("Rating: \(result)")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}

let result = try? checkPassword(string)
