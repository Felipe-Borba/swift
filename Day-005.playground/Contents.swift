import Cocoa

var greeting = "Hello, playground"

if greeting.isEmpty {
    greeting = "another"
}

print(greeting)

enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun
switch forecast {
case .sun:
    print("It should be a nice day.")
    fallthrough
case .rain:
    print("Pack an umbrella.")
case .wind:
    print("Wear something warm")
case .snow:
    print("School is cancelled.")
case .unknown:
    print("Our forecast generator is broken!")
}

let age = 18
let canVote = age >= 18 ? "Yes" : "No"
