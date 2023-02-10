import Cocoa

var greeting = "Hello, playground"

var name = "Ted"
name = "Mika"

let y = 1 //let same as const in js
//y = 4 // will complain
print(y)
print(y != 1)
let movie = """
A day in
the life of an
Apple engineer
"""

print(movie.count)

name.capitalized
name.lowercased()
name.uppercased()
name.uppercased().hasSuffix("KA")
name.hasSuffix("KA")

var bigNumber = 100_000_000
bigNumber += 1
//bigNumber++ // not alowed
//++bigNumber // nope
bigNumber+1
bigNumber
bigNumber.isMultiple(of: 2)


let number = 0.1 + 0.2
print(number)
