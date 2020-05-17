import UIKit

var str = "Hello, playground"

class BirthdayCake {
    let birthdayAge: Int
    let birthdayName: String
    var feeds = 20
    
    init() {
        birthdayAge = 6
        birthdayName = "Дагмар"
        print("\(birthdayName), твой торт готов!")
    }
    
    init(age: Int, name: String) {
        birthdayAge = age
        birthdayName = name
        print("\(birthdayName), твой торт готов!")
    }
    
    func message (shouldIncludeAge: Bool) -> String {
        if shouldIncludeAge {
            return "С днем рождения, \(birthdayName)! Тебе \(rightYear())."
        }
        return "С днем рождения, \(birthdayName)!"
    }
    
    func rightYear() -> String {
        var year = "лет"
        let remainder = birthdayAge % 10
        switch remainder {
        case 1:
            if birthdayAge != 11 {
                year = "год"
            }
        case 2, 3, 4:
            if birthdayAge != 12 && birthdayAge != 13 && birthdayAge != 14 {
                year = "года"
            }
        default:
            break
        }
        return "\(birthdayAge) " + year
    }
}

let myCake = BirthdayCake()

let age = myCake.birthdayAge
print("Моему торту понадобится \(age) свечек.")
print("На торте будет написано С днем рождения, \(myCake.birthdayName)")
print("Говорят, торт человек на \(myCake.feeds)")
myCake.feeds = 10
print("По правде, от силы на \(myCake.feeds)")

let newCake = BirthdayCake()
newCake.birthdayAge
newCake.birthdayName

let twinsCake = BirthdayCake(age: 11, name: "Колин и Бренна")

let brownieCake = BirthdayCake(age: 11, name: "Гретхен")
brownieCake.message(shouldIncludeAge: true)
