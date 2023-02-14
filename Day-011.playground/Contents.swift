import Cocoa


struct BankAccount {
    private(set) var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 2000)
//account.funds = 20
account.funds


struct Employee {
    let username: String
    let password: String

    static let example = Employee(username: "cfederighi", password: "hairforceone")
}
var example = Employee.example
example.username

// checkpoint 6

struct Car {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear: Int = 0
    
    mutating func gearUp() {
        if currentGear < 5 {
            currentGear += 1
        }
    }
    
    mutating func gearDown() {
        if currentGear > 0 {
            currentGear -= 1
        }
    }
}

var honda = Car(model: "Honda", numberOfSeats: 4)
honda.currentGear
honda.gearUp()
honda.currentGear
honda.gearDown()
honda.currentGear
honda.gearDown()
honda.gearDown()
honda.currentGear
for _ in 1...10 {
    honda.gearUp()
}
honda.currentGear
