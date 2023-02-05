import Cocoa

var greeting = "Hello, playground"

var gameOver = false
print(gameOver)

gameOver.toggle()
print(gameOver)

greeting += "oi"

// Checkpoint 01

let temperatureInCelsius = 40.0

let temperatureInFahrenrehit = temperatureInCelsius * 9 / 5 + 32

print("Temperature in celsius: \(temperatureInCelsius) fahrenheit: \(temperatureInFahrenrehit)")
