import UIKit

var str = "Hello, playground"

print("Swift классный!")

func printAHaiku() {
    print("Вход или выход")
    print("Тут функции не нужны")
    print("Для таких хокку")
}

printAHaiku()

func invite(guest: String) {
    print("Привет, \(guest),")
    print("Хочу пригласить тебя на мою вечеринку!")
    print("Она состоится в субботу у меня дома.")
    print("Надеюсь, ты сможещь прийти")
    print("С любовью, Бренна\n")
}

invite(guest: "Кэти")
invite(guest: "Меган")
invite(guest: "Мэдди")


func invite(allGuests: [String]) {
    for guest in allGuests {
        invite(guest: guest)
    }
}

let friends = ["Кэти", "Меган", "Мэдди", "Джулия", "Софи", "Эшер"]
invite(allGuests: friends)

func sendMessage(guest: String, rsvped: Bool) {
    print("Привет, \(guest),")
    if rsvped {
        print("Я с нетерпением жду тебя в выходные!")
    } else {
        print("Надеюсь, что тебе удастся прийти на мою вечеринку.")
        print("Можешь ли ты подствердить участие до завтра?")
    }
    print("У нас будет бассейн, так что захвати купальный костюм!")
    print("С любовью, Бренна\n")
}

sendMessage(guest: "Джулия", rsvped: true)
sendMessage(guest: "Эшер", rsvped: false)

func sendThankYou(to guest: String, for gift: String) {
    print("Привет, \(guest)")
    print("Спасибо за участие а моей вечеринке и за \(gift).")
    print("Было здорово с тобой встретится!")
    print("С любовью, Бренна\n")
}

sendThankYou(to: "Меган", for: "книжку с головоломками")

func volumeOfBoxWithSides(_ side1: Int, _ side2: Int, _ side3: Int) {
    print("Объем этой коробки - \(side1 * side2 * side3).")
}

volumeOfBoxWithSides(3, 4, 6)

func volumeOfBox(_ side1: Int, _ side2: Int, _ side3: Int) -> Int {
    let volume = side1 * side2 * side3
    return volume
}

let volumeOfBox1 = volumeOfBox(6, 5, 3)
let volumeOfBox2 = volumeOfBox(8, 4, 2)


if volumeOfBox1 > volumeOfBox2 {
    print("Коробка 1 больше.")
} else if volumeOfBox1 < volumeOfBox2 {
    print("Коробка 2 больше.")
} else {
    print("Коробки имеют одинаковый размер.")
}

func averageOf(_ scores: [Int]) -> Int {
    var sum = 0
    for score in scores {
        sum += score
    }
    if scores.count > 0 {
        return sum / scores.count
    } else {
        return 0
    }
}

averageOf([84, 86, 78, 98, 80, 92, 84])
averageOf([])
