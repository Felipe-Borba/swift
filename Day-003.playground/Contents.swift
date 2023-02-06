import Cocoa

var  names = [String]()
//names.append(1) // error
names.append("nome")

names.contains("nome")

//dictionary
let employee2 = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]

employee2["name"]
//employee2.name error
print(employee2["dog", default: "Unknown"])
print(employee2["name"])

var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206
print(heights)

var people = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"])
people.remove("Tom Cruises")
people.remove("Tom Cruise")
people


enum Weekday {
    case monday 
    case tuesday
    case wednesday
    case thursday
    case Friday
}
Weekday.Friday

enum Day {
    case first, second
}

var day = Day.first
day = .second
