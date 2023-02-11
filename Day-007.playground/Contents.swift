import Cocoa

func printTimesTables(number: Int=2, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

//printTimesTables(number: 5, end: 20)
//printTimesTables(1) //missing argument error

func test(a: String, n: Int=1) {
    print("go")
}

//test("now") // missing argument label
test(a: "valid")

func oneParam(value: Int) {
    print(value)
}

//oneParam(2) // label is missing error
func buyCar(price: Int) {
    switch price {
    case 0...20_000:
        print("This seems cheap.")
    case 20_001...50_000:
        print("This seems like a reasonable car.")
    case 50_001...100_000:
        print("This had better be a good car.")
    default:
        print("Error")
    }
}

buyCar(price: 60_000)

func rollDice() -> Int { // if not specify the return it will break
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

let scrambled="some"
let sorted=scrambled.sorted()
print(sorted=="osme".sorted())

func areLettersIdentical(string1: String, string2: String) -> Bool {
    //let t = 1
    string1.sorted() == string2.sorted() // one line functions dont ned return its implicity
}
print(areLettersIdentical(string1: "manga", string2: "uva"))

func getUser() -> (firstName: String, lastName: String) {
    //(firstName: "Taylor", lastName: "Swift")
    ("Taylor","Swift")
}

let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")

func getUser1() -> (String, String) {
    ("Taylor", "Swift")
}

let user2 = getUser()
print("Name: \(user2.0) \(user2.1)")

let (firstName, _) = getUser() //desctructing is not quite the same as js you have to add the _
print("Name: \(firstName)")

func hireEmployee(name: String) { }
func hireEmployee(title: String) { }
func hireEmployee(location: String) { }
hireEmployee(title: "tt")

func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result2 = isUppercase(string)

func weirdOne(externalName internalName: Int) { // externalName can even be a reserved word
    print(internalName)
}
weirdOne(externalName: 10)

func myFunction(Str number:Int) {
    print("I told you \(number)")
}
myFunction(Str: 1) // to think this is a valid function call
