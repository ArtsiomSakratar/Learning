import UIKit

var str = "Hello, playground"

var myAge = 14
var yourAge = myAge
print("Мне \(myAge) лет, а тебе - \(yourAge)")
yourAge = 15
print("Теперь мне \(myAge) лет, а тебе - \(yourAge)")

class Kid {
    var age: Int
    init(age: Int) {
        self.age = age
    }
}

var finn = Kid(age: 9)
var nathan = Kid(age: 10)
print("Натану - \(nathan.age) лет, Финну - \(finn.age)")
nathan.age = 10
print("Теперь Натану \(nathan.age) лет, и Финну тоже \(finn.age)")

class Couch {
    var numberOfCushions = 3
    func description() -> String {
        return "У этой кушетки \(numberOfCushions) подушки."
    }
}

var myFirstCouch = Couch()
var mySecondCouch = myFirstCouch
myFirstCouch.description()
mySecondCouch.description()
mySecondCouch.numberOfCushions = 4
myFirstCouch.description()
mySecondCouch.description()
