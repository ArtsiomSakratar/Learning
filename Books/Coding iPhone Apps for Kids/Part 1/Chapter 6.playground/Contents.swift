import UIKit

var str = "Hello, playground"


var nationalParks: [String] = ["Акадия", "Зайон", "Гранд-Каньон"]

print("Первым делом я поехал в парк \(nationalParks[0])")
print("Вторым парком был \(nationalParks[1])")

nationalParks.append("Бэдленс")
nationalParks.insert("Петрифайд-форест", at: 3)

let fruits = ["банан", "киви", "черника"]
let liquids = ["мед", "йогурт"]

var smoothie = fruits + liquids

smoothie += ["взбитые сливки"]

var shoppingList = ["молоко", "хлеб", "конфеты", "яблоки", "ветчина"]

let purchasedList = shoppingList.removeLast()
shoppingList

let notGoingToPurchase = shoppingList.remove(at: 2)
shoppingList

shoppingList.removeAll()

var favoriteAnimals = ["Лев", "Аллигатор", "Слон"]
favoriteAnimals[2] = "Единорог"
favoriteAnimals[0] = "Игуана"
favoriteAnimals

let mySiblings = ["Джеки", "Гретхен", "Джуд"]
if mySiblings.isEmpty {
    print("У меня нет братьев и сестер.")
} else {
    print("У меня \(mySiblings.count) братьев и сестер.")
}

let pizzaToppings = ["Сыр", "Томат", "Пепперони", "Сосиски", "Грибы", "Лук", "Ветчина", "Ананас"]
for topping in pizzaToppings {
    print(topping)
}

let myNumbers = [1, 4, 7, 10, 12, 15]
print("Это массив myNumbers: \(myNumbers)")

print("Это квадраты всех чисел из myNumbers:\n")
for number in myNumbers {
    print("\(number) в квадрате равно \(number * number)")
}

var countries = ["IT": "Италия", "RU": "Россия", "FR": "Франция"]

let fraction = [0.25: "1/4", 0.5: "1/5", 0.75: "3/4"]

if let biggestCountry = countries["RU"] {
    print("Страна \(biggestCountry) есть в моем словаре.")
} else {
    print("Этой страны нет в моем словаре.")
}
if let smallCountry = countries["VA"] {
    print("Страна \(smallCountry) есть в моем словаре.")
} else {
    print("Этой страны нет в моем словаре.")
}

countries["AU"] = "Австрия"
countries

countries["IT"] = nil
countries

var colorFruits = ["красный": "яблоко", "желтый": "банан"]
colorFruits["красный"] = "малина"
colorFruits

let fruitBasket = ["Яблоко": "$0.50", "Банан": "$1.00", "Апельсин": "$0.75"]
if fruitBasket.isEmpty {
    print("У меня не осталось фруктов.")
} else {
    print("У меня осталось \(fruitBasket.count) фрукта на продажу.")
}

for fruit in fruitBasket.keys {
    print("Один \(fruit) стоит \(fruitBasket[fruit]!)")
}

for price in fruitBasket.values {
    print("У меня есть фрукт, который стоит \(price)")
}
