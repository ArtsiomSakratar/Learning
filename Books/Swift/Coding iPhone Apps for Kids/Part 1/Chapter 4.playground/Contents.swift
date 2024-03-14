import UIKit
import Foundation

var str = "Hello, playground"

for number in 1...4 {
    print("Привет, меня зовут Колин.")
    print("Теперь значение числа равно \(number). \n")
}

let kidsInClass = ["Гретхен", "Кристина", "Джимми", "Маркус", "Хелен", "Эрик", "Алекс"]
for kidsName in kidsInClass {
    print("Доброе утро, \(kidsName)!")
}

let numberIAmThinkingOf = 7
var currentGuess = -1
print("Загадал число между 1 и 20. Угадай его.")
while currentGuess != numberIAmThinkingOf {
    currentGuess = Int(arc4random_uniform(20)) + 1
    print("Хмм... дай подумать, \(currentGuess)?")
}
print("Угадал! Правильный ответ - \(currentGuess)!")


var shrinking = "Спасите! Я исчезаю!"
repeat {
    print(shrinking)
    shrinking = String(shrinking.dropLast())
} while shrinking.count > 0

for count in 1...10 {
    // Block A
    if count % 2 == 0 {
        // Block B
        var starString = ""
        for starCount in 1...count {
            // Block C
            starString += "*"
        }
        print(starString)
    } else {
        // Block D
        var dashString = ""
        for dashCount in 1...count {
            // Block E
            dashString += "-"
        }
        print(dashString)
    }
}

let isMorning = true
var greeting = ""
if isMorning {
    greeting = "Доброе утро"
} else {
    greeting = "Добрый день"
}
print(greeting)
