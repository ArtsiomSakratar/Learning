import UIKit

var str = "Hello, playground"

var grade = 5
var futureTeacher: String?

futureTeacher = "Миссис Глисон"
//futureTeacher = nil


if futureTeacher != nil {
    print("Думаю, в следующем году моим учителем будет \(futureTeacher).")
} else {
    print("Я не знаю, кто будет моим учителем в следующем году.")
}

if let knownTeacher = futureTeacher {
    print("Думаю, в следующем году моим учителем будет \(knownTeacher).")
} else {
    print("Я не знаю, кто будет моим учителем в следующем году.")
}

let defaultLunch = "пицца"
var specialLunch: String?
var myLunch = specialLunch ?? defaultLunch

print("Мой обед в понедельник - \(myLunch).")

specialLunch = "пирог с мясом"
myLunch = specialLunch ?? defaultLunch

print("Мой обед в понедельник - \(myLunch).")
