import Swift
import UIKit
import Foundation

var str: String
str = "Hello, playground world!" // Комментарий

/*
 Этот комментарий занимает
 больше одной строки.
 */

/*
 * Этот комментарий занимает
 * больше одной строки.
 */

/* Этот еще один способ написания однострочного комментария. */

do {
    var str: String // Неинициализированная переменная
}

//var count = 2
//count = "Two" // Error

var count = 2; count = 3

let pi = 3.14159265
var value = pi

//pi = 42 // ОШИБКА - присвоить повторно значение константе pi нельзя

print("Hello, world")

print("Hello, world", terminator: "")

print(Int8.max)     // 127
print(Int8.min)     // -128
print(Int32.max)    // 2,147,483,647
print(Int32.min)    // -2,147,483,648
print(UInt32.max)   // 4,294,967,295

let decimal = 123   // Значение равно 123
let octal = 0o77    // Восьмеричное значение 77 равно десятичному 63
let hex = 0x1234    // Шестнадцатиричное 1234 равно десятичному 4660
let binary = 0b1010 // Двоичное значениер 1010 равно десятичному 10

let v = -1_234      // То же, что и -1234
let w = 12_34_56    // То же, что и 123456

let a = 1.23        // Тип этого значения выводится как Double
let b: Float = 1.23 // Тип этого значения принудительно обозначает как Float

let c = 1.23e2      // Вычисляется как 123.0
let d = 1.23e-1     // Вычисляется как 0.123
let e = 1.23E-1     // То же, что и 1.23e-1

let f: Float = 0.123456789123           // 0.1234568
let g: Double = 0.12345678912345678     // 0.1234567891234568

do {
    let f: Float = 123456789123456     // Неточно: 1.234568e+14
    let g: Double = 123456789123456    // Точно: 123,456,789,123,456.0
    let h: Double = 12345678912345678    // Неточно: 1.234567891234568e+17
}

//let a = 123
//let b = 0.456
//let c = a + b        // Error

do {
    let a = 123
    let b = 0.456
    let c = Double(a) + b
}

do{
    let a: CGFloat = 123
    let b: Double = 456
    let c = a + CGFloat(b)    // Результат типа CGFloat
}

do {
    let a: CGFloat = 123
    let b: Double = 456
    let c = Double(a) + b    // Результат типа Double
}

1 + 0.5 // Вычисляется как 1.5

do {
    let a = Int.max
    let b = 1
    let c = Int.max &+ b
}

do {
    let a = 4
    let b = a << 2    // Результат равен 16
    let c = b >> 1    // Результат равен 8
}

do {
    let a = 4
    let b = a << 2    // Результат равен -16
    let с = b >> 1    // Результат равен -8
}

do {
    let a = 7          // Значение равно 0b111
    let b = 3          // Значение равно 0b011
    let c = a & b    // Результат равен 0b011 = 3
}

do {
    let a = 7          // Значение равно 0b111
    let b = 3          // Значение равно 0b011
    let c = a | b    // Результат равен 0b111 = 7
}

do {
    let a = 7         // Значение равно 0b111
    let b = 3         // Значение равно 0b011
    let c = a ^ b // Результат равен 0b100 = 4
}

do {
    var a = 10
    a += 20           // Сокращенный вариант операции a = a + 20, результат = 30
    var b = 7
    b &= 3            // Сокращенный вариант операции b = b & 3, результат = 3
}

do {
    let a = 0b1001
    let b = ~a      // Поразрядное инвентирование
}

do {
    let str = "Hello, playground"
    let quotes = "Contains \"quotes\""      // Результат равен Contains "quotes"
    let backslash = "\\"    // Результат равен \
    let atSign = "@\u{40}"  // Результат равен @@
    let specialChars = "Line1\nLine2\tTabbed"
}

print("The value of pi is \(Double.pi)") // Выводит символьную строку "The value of pi is 3.14159265358979\n"

// В этом фрагменте кода выводится символьная строка: "Area of a circle of radius 3.0 is 28.2743338823081\n"
let r = 3.0
print("Area of a circle of radius \(r) is \(Double.pi * r * r)")

do {
    let s = "That's one small step for man, " +
        "one giant leap for mankind"
    print(s)    // "That's one small step for man, one giant leap for mankind"
}

do {
    let s1 = "String one"
    let s2 = "String two"
    let s3 = "String " + "one"
    s1 == s2 // False: строки не одинаковые
    s1 != s2 // True: строки разные
    s1 == s3 // True: строки состоят из одинаковых символов
    
    s3.count        // 10
    s3.utf16.count  // 10
}

do {
    let s = "Hello"
    for c in s {
        print(c)
    }
}

do {
    let c: Character = "s"
    var s = "Book"             // Эта переменная объявляется как var, поскольку она будет видоизменена
    //    s += c                // ОШИБКА - недопустимо!
    s.append(c)              // "Books"
}

do {
    var s1 = "Book"
    var s2 = s1         // Строка s2 теперь содержит копию строки s1
    s2 += "s"           // Символ "s" присоединяется к строке s2, а строка s1 не изменяется
    s1                  // Book
    s2                  // Books
}

do {
    var b1 = true // Выводится значение типа Bool
    var b2: Bool
    b2 = false
}

do {
    var a13 = 100
    var b24 = 200
    var c12 = a13
    
    a13 == c12      // true
    a13 == b24      // false
    a13 != b24      // true
    a13 > b24       // false
    a13 < b24       // true
    a13 >= c12      // true
}

do {
    let a = "AB"
    let b = "C"
    let c = "CA"
    let d = "AB"
    a == b          // false: строки имеют разное содержимое
    a == d          // true: строки имеют одинаковое содержимое
    a != c          // true: строки имеют разное значение
    a > b           // false: используется порядок сортировки
    a < c           // true: обе строки начинаются с символа C, но строка c длиннее строки a
}

do {
    var a = 100
    var b = 200
    a == b          // false
    !(a == b)       // !false == true
}

do {
    var a = 100
    var b = 200
    var c = 300
    
    a < b && c > b      // true: вычисляется оба выражения
    a < b || c > b      // true: второе выражение не вычисляется
    a > b && c > b      // false: второе выражение не вычисляется
}

do {
    enum DaysOfWeek {
        case Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
    }
}

do {
    enum DaysOfWeek {
        case Sunday
        case Monday
        case Tuesday
        case Wednesday
        case Thursday
        case Friday
        case Suturday
    }
    
    var day = DaysOfWeek.Sunday // Тип переменной day выводится как перечислимый тип DaysOfWeek
    day = .Friday // Указывать точку "." обязательно!
}

enum Status {
    case OK
    case ERROR(String)
}

let status = Status.OK
let failed = Status.ERROR("That does not compute")

do {
    enum DaysOfWeek : Int {
        case Sunday = 0
        case Monday         // 1
        case Tuesday        // 2
        case Wednesday      // 3
        case Thursday       // 4
        case Friday = 20    // 5
        case Saturday       // 21
    }
    
    var day = DaysOfWeek.Saturday
    let rawValue = day.rawValue         // Равно 21; верна также и следующая ссылка: DaysOfWeek.Saturdat.rawValue
}

do {
    enum ResultType : String {
        case SUCCESS = "Success"
        case WARNING = "Warning"
        case ERROR = "Error"
    }
    
    let s = ResultType.WARNING.rawValue     // s = "Warning"
    let result = ResultType(rawValue: "Error")
}

do {
    var integers = [1, 2, 3]
    var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    integers[0]     // 1
    integers[2]     // 3
    days[3]         // "Wednesday
    
    integers[0] = 4         // [4, 2, 3]
    days[3] = "WEDNESDAY"   // Заменяет "Wednesday" на "WEDSNESDAY"
}

do {
    var integers: [Int]     // [Int] означает массив значений типа Int
    
    integers = [1, 2, 3]
    
    var empty: [String] = []
}

do {
    var integers = [1, 2, 3]
    integers[1..<3]             // Получить 1-й и 2-й элементы массива. Результат равен [2, 3]
    integers[1..<3] = [4]       // Заменить 1-й и 2-й элементы массива 4-м элементом. Результат равен [1, 4]
    
    integers = [1, 2, 3]
    integers[0...1] = [5, 4]    // Заменить нулевой и 1-й элементы массива элементами [5, 4]. Результат равен [5, 4, 3]
}

do {
    var integers = [1, 2, 3]
    integers.count              // 3
    integers[1..<3] = [4]
    integers.count              // 2
}

do {
    var integers = [1, 2, 3]
    integers.append(4)          // Результат равен [1, 2, 3, 4]
    integers.insert(-1, at: 0)  // Результат равен [-1, 2, 3, 4]
}

do {
    var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    days.remove(at: 3)                          // Удаляет строку "Wednesday" и возваращает ее вызывающему коду
    days.removeSubrange(0..<4)                  // Оставляет в массиве только элементы ["Friday", "Saturday"]
    days.removeAll(keepingCapacity: false)      // Оставляет массив пустым
}

do {
    let integers = [1, 2, 3]                         // Массив констант
    //    integers = [4, 5, 6]                            // ОШИБКА: заменить массив нельзя!
    //    integers[0] = 2                                 // ОШИБКА: переназначить элемент массива нельзя!
    //    integers.removeAll(keepingCapacity: false)      // ОШИБКА: невозможно модифицировать содержимое
}

do {
    var integers = [1, 2, 3]
    var integersCopy = integers     // Создается копия массива integers
    integersCopy[0] = 4             // Массив integers не изменяется
    integers                        // [1, 2, 3]
    integersCopy                    // [4, 2, 3]
}

do {
    let integers = [1, 2, 3]
    integers.contains(2)        // true
    integers.contains(4)        // false
}

do {
    let integers = [1, 2, 3]
    integers.firstIndex(of: 3)      // Результат равен 2
    integers.firstIndex(of: 5)      // Результат равен nil
}

do {
    var dict = ["Red": 0, "Green": 1, "Blue": 2]
}

do {
    var dict: [String: Int]
    dict = ["Red": 0, "Green": 1, "Blue": 2]
    
    let value = dict["Red"]     // Результат равен 0, значение отображается в ключ "Red"
    
    dict["Yellow"] = 3          // Вводит новое значение по ключу "Yellow"
    dict["Red"] = 4             // Обновляет значение по ключу "Red"
}

do {
    var dict = ["Red": 0, "Green": 1, "Blue": 2]
    dict.removeValue(forKey: "Red")         // Удаляет значение по ключу "Red"
    dict.removeAll()                        // Опусташает словарь
}

do {
    let fixedDict = ["Red": 0, "Green": 1, "Blue": 2]
    //    fixedDict["Yellow"] = 3                 // Недопустимо
    //    fixedDict["Red"] = 4                    // Недопустимо
    //    fixedDict = ["Blue": 7]                 // Недопустимо
    //    fixedDict.removeValue(forKey: "Red")    // Недопустимо
}

do {
    var dict = ["Red": 0, "Green": 1, "Blue": 2]
    dict.count      // 3
}

do {
    var dict = ["Red": 0, "Green": 1, "Blue": 2]
    var dictCopy = dict
    dictCopy["Red"] = 4         // Не оказывает влияния на исходный словарь в переменной dict
    dict                        // "Red": 0, "Green": 1, "Blue": 2
    dictCopy                    // "Red": 4, "Green": 1, "Blue": 2
}

do {
    let s1 = Set([1, 2, 3])
    let s2: Set<Int> = [1, 2, 3]
    
    s1.contains(1)  // true
    s2.contains(4)  // false
    s1.count        // 3
}

do {
    var s1 = Set([1, 2, 3])     // [2, 3, 1] (порядок значения не имеет)
    s1.insert(4)                // [2, 3, 1, 4]
    s1.remove(1)                // [2, 3, 4]
    s1.removeAll()              // [] (empty set)
}

do {
    let s: NSString = "Red,Green,Blue"
    let components = s.components(separatedBy: ",")     // Вызывет метод класса NSString
    components                                          // ["Red", "Green", "Blue"]
}

do {
    let d = NSDictionary()
    let e = d as Dictionary
}

do {
    let d = NSDictionary()
    let e = d as! [String: String]
}

do {
    var color = "Red"
    //    color = nil      // Недопустимо: переменная color не относится к необязательному типу!
    
    let dict = [0: "Red", 1: "Green", 2: "Blue"]
    //    color = dicr[0]  // Недопустимо: значение статьи словаря dict[0] относится к необязательному строковому типу, тогда как значение переменной color не является необязательным!
}

do {
    let dict = [0: "Red", 1: "Green", 2: "Blue"]
    var color: String?      // Здесь "String?" означает необязательный строковый тип
    color = dict[0]         // Допустимо!
    print(color)
    
    let actualColor = color!    // Здесь "color!" означает извличение конкретного значения из оболочки необязательного типа
}

do {
    let dict = [0: "Red", 1: "Green", 2: "Blue"]
    let color = dict[4]
    //    let actualColor = color!
    
    if color != nil {
        let actualColor = color!
    }
    
    if let actualColor = color {
        // Выполняется только в том случае, если переменная color не содержит пустое значение nil
        print(actualColor)
    }
    
    if var color = color {
        // Выполняется, только если значение исходной переменной color цвета не равно nil
        print(color) // Ссылка на новую переменную, содержащую распакованное значение
    }
}

do {
    let dict = [0: "Red", 1: "Green", 2: "Blue"]
    let color = dict[0]
    if var color = color {
        // Выполняется, только если переменная color не равна nil
        print(color)    // "Red"
        color = "Green" // Повторное присваивание локальной переменной
    }   // Новая переменная color выходит из области вилимости
    color // Ссылка на исходное значение "Red"
}

do {
    let dict = [0: "Red", 1: "Green", 2: "Blue"]
    let color = dict[4]
    let actualColor = color ?? "Blue"
}

do {
    enum ResultType : String {
        case SUCCESS = "Success"
        case WARNING = "Warning"
        case ERROR = "Error"
    }
    let result = ResultType(rawValue: "Invalid")
}

do {
    let dict = [0: "Red", 1: "Green", 2: "Blue"]
    var color: String!      // Обратите внимание на операцию !
    color = dict[0]         // Присваивает Optional("Red"), т.е. значение, заключенное в оболочку необязательного типа
    print(color)            // Автоматически извлекает значение из оболочки необязательного типа
}

do {
    let d = NSDictionary(objects: [0, 1, 2], forKeys: [0 as NSCopying, 1 as NSCopying, 2 as NSCopying])
    if let value = d[1] as? String {    // Оператор as? возвращает nil если d не имеет тип String?
        print("OK")                     // Все в порядке
    } else {
        print("Incorrect types")        // Выполняется, если d не имеет тип [Int: String]
    }
    
    if d is [Int: String] { // Вычисляется логическое значение true, если статьи в словаре d преобразуются из типа Int в тип String
        print("Is [Int: String")
    } else {
        print("Incorrect types")
    }
}

do {
    let s = "Fred"
    let n = s as NSString
}

do {
    let label = UILabel()
    let view = label as UIView
}

do {
    let view: UIView = UILabel()
    //    let label: view as! UILabel // Требуется понижающее приведение!
}

do {
    let d = NSDictionary(objects: ["Red", "Green", "Blue"], forKeys: [0 as NSCopying, 1 as NSCopying, 2 as NSCopying])
    let color = d[1] as! String
}

do {
    let random = arc4random_uniform(10)
    if random < 5 {
        print("Hi")
    } else {
        print("Ho")
    }
    
    if random < 5 {     // Круглые скобки не требуются
    }
    
    if (random < 5) {   // Но могут быть использованы
    }
    
    //    if random < 5
    //        print("Hi") // Неверно: должно быть в фигурных скобках!
    //    else
    //        print("Ho") // Неверно: должно быть в фигурных скобках!
}

do {
    let random = arc4random_uniform(10)
    random < 5 ? print("Hi") : print("Ho")
    
    print(random < 5 ? "Hi" : "Ho")
}

do {
    let dict = [0: "Red", 1: "Green", 2: "Blue"]
    let color = dict[0]
    if let color = color {
        // Выполняется только если значение color не равно nil
        print(color)    // "Red"
    }
}

do {
    let dict = [0: "Red", 1: "Green", 2: "Blue", 3: "Green", 4: "Yellow"]
    let color1 = dict[Int(arc4random_uniform(6))]
    let color2 = dict[Int(arc4random_uniform(6))]
    if let color1 = color1, let color2 = color2 {
        // Выполняются, не только если обе переменные, color1 и color2, не равны nil
        print("color1: \(color1), color2: \(color2)")
    }
}

do {
    let dict = [0: "Red", 1: "Green", 2: "Blue", 3: "Green", 4: "Blue"]
    let color1 = dict[Int(arc4random_uniform(6))]
    let color2 = dict[Int(arc4random_uniform(6))]
    if let color1 = color1, let color2 = color2, color1 == color2 {
        // Выполняется, только если значение одинаково
        print("color1: \(color1), color2: \(color2)")
    }
}

do {
    let dict = [0: "Red", 1: "Green", 2: "Blue", 3: "Green", 4: "Yellow"]
    let color1 = dict[Int(arc4random_uniform(6))]
    let color2 = dict[Int(arc4random_uniform(6))]
    if dict.count > 3, let color1 = color1, let color2 = color2, color1 == color2 {
        print("color1: \(color1), color2: \(color2)")
    }
}


//for var i = 0; i < 10; i+=1 {
//  print(i)
//}

for i in 0..<10 {
    print(i)
}

for i in stride(from: 10, through: 0, by: -2) {
    print(i)
}

do {
    let strings = ["A", "B", "C"]
    for string in strings {
        print(string)
    }
}

do {
    let d = [0: "Red", 1: "Green", 2: "Blue"]
    for key in d.keys {
        print("\(key) -> \(d[key])")
    }
    
    for (key, value) in d {
        print("\(key) -> \(value)")
    }
}

do {
    var i = 10
    while i > 0 {
        print(i)
        i -= 1
    }
    
    var j = 10
    repeat {
        print(j)
        j -= 1
    } while j > 0
}

do {
    let value = 11
    switch value {
    case 2, 3, 5, 7, 11, 13, 17, 19:
        print("Count is prime and less than 20")
    case 20...30:
        print("Count between 20 and 30")
    default:
        print("Greater than 30")
    }
    
    switch (value) {
    //case 2:
    case 3: // Недопустимо, так как предыдущая ветвь case пустая!
        print("Value is 2 or 3")
    default: print("Value is neither 2 nor 3")
    }
    
    switch (value) {
    case 2, 3:  // Верно, поскольку в этой ветви case перехватывается значения 2 и 3
        print("Value is 2 or 3")
    default:
        print("Value is neither 2 nor 3")
    }
    
    switch (value) {
    case 2: fallthrough
    case 3: // Неправильно - предыдущая ветвь пустая.
        print("Value is 2 or 3")
    default:
        print("Value is neither 2 nor 3")
    }
}

do {
    let s = "Hello"
    switch s {
    case "Hello":
        print("Hello to you, too")
    case "Goodbye":
        print("See you tomorrow")
    default:
        print("I don't understand")
    }
}

do {
    enum Status {
        case OK
        case ERROR(String)
    }
    
    let result = Status.ERROR("Network connection rejected")
    
    switch (result) {
    case .OK:
        print("Success!")
    case .ERROR(let message):
        print("Ooops: \(message)")
    }
}

do {
    func areaOfRectagle(width: Double, height: Double) -> Double {
        return width * height
    }
    
    func hello() {
        print("Hello, world")
    }
    
    var debug = true    // Разрешает отладку
    func debugPrint(value: Double) {
        if debug {
            print(value)
        }
    }
    
    let area = areaOfRectagle(width: 20, height: 10)
}

do {
    func areaOfRectangle(width w: Double, height h: Double) -> Double {
        return w * h
    }
    
    let area = areaOfRectangle(width: 20, height: 10)
}

do {
    func separateWords(str: String, delimiter: String = " ") -> [String] {
        return str.components(separatedBy: delimiter)
    }
    
    let result = separateWords(str: "One small step")
    print(result) // [One, small, step]
    
    let result2 = separateWords(str: "One. Two. Three", delimiter: ". ")
    print(result2)   // [One, Two, Three]
}

do {
    func separateWord(str: String, _ delimiter: String = " ") -> [String] {
        return str.components(separatedBy: delimiter)
    }
    let result = separateWord(str: "One. Two. Three", ". ") // Нужен разделитель
    print(result)   // [One. Two. Three]
}

do {
    func areaOfRectangle(_ w: Double, _ h: Double) -> Double {
        return w * h
    }
    let area = areaOfRectangle(20, 10)
}

do {
    var operation: (Double) -> Double
    // var operation2: Double -> Double // В Swift 3 больше не допускается
    
    func double(number: Double) -> Double {
        return 2 * number
    }
    
    operation = double
    operation(2)    // Результат равен 4
    
    func quadrupleMe(number: Double) -> Double {
        return 4 * number
    }
    
    operation = quadrupleMe
    operation(2)    // Результат равен 8
}

do {
    func compareInts(_ first: Int, _ second: Int) -> Bool {
        return first < second
    }
    
    var values = [12, 3, 5, -4, 16, 18]
    let sortedValues = values.sorted(by: compareInts)
    sortedValues    // Результат: [-4, 3, 5, 12, 16, 18]
    
    var values2 = [12, 3, 5, -4, 16, 18]
    values2.sort(by: compareInts)
    values2     // Результат: [-4, 3, 5, 12, 16, 18]
}

do {
    var values = [12, 3, 5, -4, 16, 18]
    let sortedValues = values.sorted(by: {(first: Int, second: Int) -> Bool in
        return first < second
    })
    sortedValues
}


do {
    var values = [12, 3, 5, -4, 16, 18]
    let sortedValues = values.sorted {
        // Замыкание вынесено за скобки
        (first: Int, second: Int) -> Bool in
        return first < second
    }
    sortedValues
}

do {
    var values = [12, 3, 5, -4, 16, 18]
    let sortedValues = values.sorted() {
        first, second in    // Типы аргументов и возвращаемый тип выводятся в языке Swift автоматически!
        return first < second
    }
    sortedValues
    
    let sorted = values.sorted() { return $0 < $1}
    sorted
    
    let sorted2 = values.sorted() {$0 < $1}
    sorted2
}

do {
    func getInterestCalculator(rate: Double) -> (Double, Int) -> Double {
        let calculator = {
            (amount: Double, years: Int) -> Double in rate * amount * Double(years)
        }
        return calculator
    }
    
    let calculator = getInterestCalculator(rate: 0.05)
    calculator(100.0, 2)    // Результат равен 10: процентный доход при ставке 5% от суммы 100 долларов за 2 года
}

do {
    let s = try? String(contentsOfFile: "XX", encoding: String.Encoding.utf8)
    
    if let s = try? String(contentsOfFile: "XX", encoding: String.Encoding.utf8) {
        print("Content loaded")
    } else {
        print("Failed to load contents of title")
    }
    
    // let s2 = try! String(contentsOfFile: "XX", encoding: String.Encoding.utf8)
}

do {
    let s = try String(contentsOfFile: "XX", encoding: String.Encoding.utf8)
    print("Loaded content \(s)")
} catch {
    print(error)
}

do {
    enum TriangleError : Error {
        case SideInvalid(reason: String)
        case AngleInvalid(reason: String)
    }
    
    func calcThirdSide(_ side1: Double, side2: Double, angle: Double) throws -> Double {
        if side1 <= 0 {
            throw TriangleError.SideInvalid(reason: "Side 1 must be >= 0, not \(side1)")
        }
        if side2 <= 0 {
            throw TriangleError.SideInvalid(reason: "Side 2 must be >= 0, not \(side2)")
        }
        if angle < 0 {
            throw TriangleError.AngleInvalid(reason: "Angle must be >= 0, not \(angle)")
        }
        if angle >= .pi {
            throw TriangleError.AngleInvalid(reason: "Angle must be <= Jt, not \(angle)")
        }
        return sqrt(side1 * side1 + side2 * side2 - 2 * side1 * side2 * cos(angle))
    }
    
    func calcThirdSide2(_ side1: Double, side2: Double, angle: Double) throws -> Double {
        guard side1 > 0 else {
            throw TriangleError.SideInvalid(reason: "Side 1 must be >= 0, not \(side1)")
        }
        
        guard side2 > 0 else {
            throw TriangleError.SideInvalid(reason: "Side 2 must be >= 0, not \(side2)")
        }
        
        guard angle >= 0 else {
            throw TriangleError.AngleInvalid(reason: "Angle must be >= 0, not \(angle)")
        }
        
        guard angle < .pi else {
            throw TriangleError.AngleInvalid(reason: "Angle must be <= p, not \(angle)")
        }
        
        return sqrt(side1 * side1 + side2 * side2 - 2 * side1 * side2 * cos(angle))
    }
    
    do {
        let side3 = try calcThirdSide(-1, side2: 4, angle: .pi/2)
        print(side3)
    } catch {
        print(error)
    }
    
    do {
        let side3 = try calcThirdSide(-1, side2: 4, angle: .pi/2)
        print(side3)
    } catch let e as TriangleError{
        print(e)
    }
    
    do {
        let side3 = try calcThirdSide(-1, side2: 4, angle: .pi/2)
        print(side3)
    } catch TriangleError.SideInvalid(let reason) {
        print("Caught invalid side: \(reason)")
    } catch {
        print("Caught \(error)")
    }
    
    do {
        let side3 = try calcThirdSide(-1, side2: 4, angle: .pi/2)
        print(side3)
    } catch {   // Invalid - this must be the last catch block
        print("Caught: \(error)")
    } catch TriangleError.SideInvalid(let reason) {
        print("Caught invalid side: \(reason)")
    }
    
    do {
        let side3 = try calcThirdSide(-1, side2: 4, angle: .pi/2)
        print(side3)
    } catch TriangleError.AngleInvalid(let reason) {
        print("Caught invalid angle: \(reason)")
    } catch TriangleError.SideInvalid(let reason) {
        print("Caught invalid side: \(reason)")
    }
}

do {
    struct CircleStruct {
        var radius: Double
        
        func getArea() -> Double {
            return .pi * radius * radius
        }
        
        func getCircumference() -> Double {
            return 2 * .pi * radius
        }
    }
    
    var circleStruct = CircleStruct(radius: 10)
    let r = circleStruct.radius     // Читает значение из свойста radius - результат равен 10
    circleStruct.radius = 2 * r     // Удваивавет радиус
    
    var newCircleStruct = circleStruct      // Копирует структуру
    newCircleStruct.radius = 32             // Воздействует на копию
    newCircleStruct.radius                  // Новое значение: 32
    circleStruct.radius                     // Прежнее значение: 20
    
    let constantCircleStruct = CircleStruct(radius: 5)
    // constantCircleStruct.radius = 10    // Неверно: constantCircleStruct является константой!
}

do {
    struct CircleStruct {
        var radius: Double = 1
        
        init() {
        }
        
        init(radius: Double) {
            self.radius = radius
        }
        
        func getArea() -> Double {
            return .pi * radius * radius
        }
        
        //        func getArea() -> Double {
        //            return .pi * self.radius * self.radius
        //            // Явное обращение к свойству по ссылке self - не рекомендуется
        //        }
        
        func getCircumference() -> Double {
            return 2 * .pi * radius
        }
        
        mutating func adjustRadiusBy(amount: Double, times: Int = 1) {
            radius += amount * Double(times)
        }
    }
    
    let circleStructDefault = CircleStruct()
    circleStructDefault.radius  // Результат равен 1.0
    circleStructDefault.getArea()
    circleStructDefault.getCircumference()
}

do {
    class CircleClass {
        var radius: Double = 1
        
        init() {
        }
        
        init(radius: Double) {
            self.radius = radius
        }
        
        func getArea() -> Double {
            return .pi * radius * radius
        }
        
        func getCircumference() -> Double {
            return 2 * .pi * radius
        }
    }
    
    var circleClassDefault = CircleClass()      // Установка радиуса по умолчанию
    circleClassDefault.radius                   // Результат равен 1
    var circleClass = CircleClass(radius: 10)   // Явная установка радиуса
    circleClass.radius                          // Результат равен 10
    
    var newCircleClass = circleClass            // Без копирования экземпляра
    newCircleClass.radius = 32                  // Только одна копия, поэтому такое изменение доступно по обеим ссылкам
    newCircleClass.radius                       // Результат равен 32
    circleClass.radius                          // Результат равен 32
}

do {
    class CircleClass {
        var radius: Double = 1 {
            didSet {
                if (radius < 0) {
                    radius = oldValue
                }
            }
        }
        var area: Double {
            get {
                return .pi * radius * radius
            }
            set {
                radius = sqrt(newValue / .pi)   // newValue — принимаемое значение
            }
        }
        
        var circumference: Double {
            get {
                return 2 * .pi * radius
            }
            set (value) {
                radius = value / (2 * .pi)      // newValue заменен на value
            }
        }
        
        init() {
        }
        
        init(radius: Double) {
            self.radius = radius
        }
        
        func adjustRadiusByAmount(amount: Double, times: Int = 1) {
            radius += amount * Double(times)
        }
    }
    
    let circleClass = CircleClass(radius: 10)
    circleClass.area
    circleClass.circumference
    
    circleClass.area = 314
    circleClass.radius          // Если площадь круга окружности - 314, то радиус окружности равен 9.997
    circleClass.circumference = 100
    circleClass.radius          // Если длина окружности равна 100, то радиус окружности равен 15.915
    
    circleClass.radius = 10     // Верно: радиус установлен равным 10
    circleClass.radius          // Результат: 10.0
    circleClass.radius = -1     // Неверно: перехвачено в блоке кода didSet
    circleClass.radius          // Результат: 10.0
    
    do {
        var circleClass = CircleClass(radius: 10)
        circleClass.radius                          // Результат: 10
        circleClass.adjustRadiusByAmount(amount: 5, times: 3)
        circleClass.radius                          // Результат = 10 + 3 * 5 = 25
        circleClass.adjustRadiusByAmount(amount: 5) // По умолчанию множитель равен 1
        circleClass.radius                          // Результат = 30
    }
    
    var optionalCircle: CircleClass?
    // optionalCircle!.radius      // АВАРИЙНЫЙ СБОЙ!
    
    if optionalCircle != nil {
        optionalCircle!.radius
    }
    
    var radius = optionalCircle?.radius
    
    if let radius = optionalCircle?.radius {
        print("radius = \(radius)")
    }
    
    optionalCircle?.adjustRadiusByAmount(amount: 5, times: 3)
}

do {
    class CircleClass {
        var radius: Double = 1 {
            didSet {
                if (radius < 0) {
                    radius = oldValue
                }
            }
        }
        
        var area: Double {
            get {
                return .pi * radius * radius
            }
            
            set {
                radius = sqrt(newValue / .pi)
            }
        }
        
        var circumference: Double {
            get {
                return 2 * .pi * radius
            }
            
            set {
                radius = newValue / (2 * .pi)
            }
        }
        
        var description: String {
            return "Circle of radius \(radius)"
        }
        
        required init() {
        }
        
        init(radius: Double) {
            self.radius = radius
        }
        
        func adjustRadiusBy(amount: Double, times: Int = 1) {
            radius += amount * Double(times)
        }
        
        func reset() {
            radius = 1
        }
    }
    
    class ColoredCircleClass : CircleClass {
        var color: UIColor = UIColor.black
        
        override var description: String {
            return super.description + ", color \(color)"
        }
        
        required init() {
            super.init()
        }
        
        init(radius: Double, color: UIColor) {
            self.color = color
            super.init(radius: radius)
        }
        
        override func reset() {
            super.reset()
            color = UIColor.black
        }
    }
    
    var coloredCircle = ColoredCircleClass()
    coloredCircle.radius            // Результат: 1
    coloredCircle.color             // Результат: black
    coloredCircle.description       // Результат: "Circle of radius 1.0, color UIDeviceWhiteColorSpace 0 1"
    
    coloredCircle = ColoredCircleClass(radius: 20, color: UIColor.red)
    coloredCircle.radius            // Результат: 20
    coloredCircle.color             // Результат: red
    coloredCircle.description       // Результат: "Circle of radius 20.0, color UIDeviceRGBColorSpace 1 0 0 1"
}

protocol Resizable {
    var width: Float { get set }
    var height: Float { get set }
    
    init(width: Float, height: Float)
    func resizeBy(wFactor: Float, hFactor: Float) -> Void
}

class Rectangle : Resizable, CustomStringConvertible {
    var width: Float
    var height: Float
    var description: String {
        return "Rectangle, width \(width), height \(height)"
    }
    
    let r: Resizable = Rectangle(width: 10, height: 10)
    
    required init(width: Float, height: Float) {
        self.width = width
        self.height = height
    }
    
    func resizeBy(wFactor: Float, hFactor: Float) -> Void {
        width *= wFactor
        height *= hFactor
    }
}

let rect = Rectangle(width: 10, height: 20)
print(rect)

extension UIColor {
    class func randomColor() -> UIColor {
        let red = CGFloat(Double((arc4random() % 256)) / 255)
        let green = CGFloat(Double((arc4random() % 256)) / 255)
        let blue = CGFloat(Double((arc4random() % 256)) / 255)
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

let randomColor = UIColor.randomColor()
