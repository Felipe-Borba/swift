import Cocoa

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os).")
}
for i in 1...10 {
    print("5 x \(i) is \(5 * i)")
}
for i in 1..<10 {
    print(i)
}

/*
 var speeds = (65, 58, 72)
 for speed in speeds {
 print("You were driving at \(speed)km/h.")
 }
 */
var countdown = Int.random(in: 1...10)

while countdown > 0 {
    print("\(countdown)…")
    countdown -= 1
}

print("Blast off!")
var number: Int = 10
while number > 0 {
    number -= 2
    if number % 2 == 0 {
        print("\(number) is an even number.")
    }
}
let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }

    print("Found picture1: \(filename)")
}
for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        break
    }

    print("Found picture2: \(filename)")
}

// checkpoint
for i in 1...100 {
    var output = ""
    
    if i.isMultiple(of: 3)  {
        output+="Fizz"
    }
    
    if i.isMultiple(of: 5) {
        output+="Buzz"
    }
    
    if output.isEmpty {
        output=String(i)
    }
    
    print(output)
}
