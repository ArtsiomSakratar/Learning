import UIKit

var str = "Hello, playground"

3 + 2 == 5
4 + 5 == 8
3 != 5
4 + 5 != 8

// Сравнение строк
let myName = "Глория"
myName == "Мелисса"
myName == "Глория"
myName == "глория"
var myHeight = 165.0
myHeight == 165.0

// Больше, чем
9 > 7
// Меньше, чем
9 < 11
// Больше или равно
3 + 4 >= 7
3 + 4 > 7
// Меньше или равно
5 + 6 <= 11
5 + 6 < 11

var age = 12
age > 10 && age < 15

age = 18
age > 10 && age < 15

let name = "Жаклин"
name == "Джек"
name == "Джек" || name == "Жаклин"

let isAGirl = true
!isAGirl && name == "Джек"
isAGirl && name == "Жаклин"
(!isAGirl && name == "Джек") || (isAGirl && name == "Жаклин")

let heightToRideAlone = 120.0
let heightToRideWithAdult = 100.0
var height = 118.5
if height >= heightToRideAlone {
    print("Твоего роста хватает, чтобы кататься на горках самостоятельно.")
} else if height >= heightToRideWithAdult {
    print ("На эти горки тебе можно в сопровождении взрослого.")
}
else {
    print("Сожалеем. Тебе нельзя на эти горки.")
}

var studentGrade = 5
var studentProject = "Нужно определить"
switch studentGrade {
case 1:
    studentProject = "Страна по выбору ученика"
case 2:
    studentProject = "Соревнования собачьих упряжек на Аляске"
case 3:
    studentProject = "Американские индейцы"
case 4:
    studentProject = "Штат по выбору ученика"
case 5:
    studentProject = "Колониальные времена"
case 6, 7, 8:
    studentProject = "Выбор ученика"
default:
    studentProject = "Не определено"
}
