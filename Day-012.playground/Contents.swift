import Cocoa


class Employee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}
final class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }

}
//class Manager: Developer {
//}

let robert = Developer(hours: 8)
robert.work()
robert.printSummary()

class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}
class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

class User1 {
    var username = "Anonymous"
    
    func copy() -> User1 {
        let user = User1()
        user.username = username
        return user
    }
}
var user1 = User1()
var user2 = user1
user2.username = "Taylor"
print(user1.username)
print(user2.username)

struct User2 {
    var username = "Anonymous"
}
var user3 = User2()
var user4 = user3
user4.username = "Taylor"
print(user3.username)
print(user4.username)


class User {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}
for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
}

var users = [User]()

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")

// checkpoint 7
class Animal {
    let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}
class Dog: Animal {
    
    init() {
        super.init(legs: 4)
    }
    
    func speak() {
        print("A dog barking")
    }
}
class Cat: Animal {
    let isTame: Bool
    
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
    
    func speak() {
        print("A cat meow")
    }
}

class Corgi: Dog {
    override func speak() {
        print("A corgi barking")
    }
}

class Poodle: Dog {
    override func speak() {
        print("A poodle barking")
    }
}

class Persian: Cat {
    override func speak() {
        print("a persion meow")
    }
}

class Lion: Cat {
    override func speak() {
        print("A lion roar")
    }
}

let lion = Lion(isTame: false)
let persian = Persian(isTame: true)
let corgi = Corgi()
corgi.speak()
let poodle = Poodle()
poodle.speak()
