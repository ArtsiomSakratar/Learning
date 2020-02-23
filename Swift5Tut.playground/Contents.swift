// Imports the Cocoa module
import Cocoa

// Comment
/*
 Multiline Comment
*/

// ---------- VARIABLES ----------

// Declare a variable thats value can change
// Variable names start with a letter and can contain numbers,
// letters, and underscores
// You only need semicolons if you want more then 1 statement
// on 1 line
var str = "Hello, world"

// Define a constant variable with let
// These 2 variables are global variables meaning that all the
// code in this file can access them
let str2 = "I'm a constant"

// Print what lies between parentheses followed by a newline
print(str)

// ---------- DATA TYPES ----------

// You can define an explicit data type to a variable or one
// will be assigned based on the data you store in it

// This is an integer
var age : Int = 45

// Min and max values
print("Min Int \(Int64.min)")
print("Max Int \(Int64.max)")

// Floats and Doubles store numbers with decimals
var pi2: Float = 3.1415
var pi3: Double = 3.1415

// Min and max doubles
print("Min Double \(Double.leastNormalMagnitude)")
print("Max Double \(Double.greatestFiniteMagnitude)")

// Floats are accurate to 15 digits
var bigF = 1.1111111111111111
var bigF2 = 1.1111111111111111
print("Big Float : \(bigF + bigF2)")

// Booleans are true or false
let canVote: Bool = true

// We can store single characters
var myGrade: Character = "A"

// Casting changes a value from 1 type to another
print("Dbl to Int : \(Int(3.4))")
print("Int to Dbl : \(Double(3))")

// Get the datatype
print("age DT : \(type(of: age))")

// Other data types : Int8, Int16, Int32, Int64,
// UInt8, UInt16, UInt32, UInt64, Float80

// ---------- MATH ----------

// You can place calculations in print
print("5 + 4 = \(5 + 4)")
print("5 - 4 = \(5 - 4)")
print("5 * 4 = \(5 * 4)")
print("5 / 4 = \(5 / 4)")
print("5 / 4 = \(5.0 / 4.0)")
print("5 % 4 = \(5 % 4)")

// There is short hand for the above
var num : Int = 1
num += 1
print("Num : \(num)")

// Generate a random value from 1 to 10
var rand = Int.random(in: 1...10)
print("Rand : \(rand)")

// Math Functions
print("abs(-5) = \(abs(-5))")
print("floor(5.5) = \(floor(5.5))")
print("ceil(5.4) = \(ceil(5.4))")
print("round(5.4) = \(round(5.4))")
print("max(5,4) = \(max(5,4))")
print("min(5,4) = \(min(5,4))")
print("pow(5,2) = \(pow(5,2))")
print("sqrt(25) = \(sqrt(25))")
print("log(2.71828) = \(log(2.71828))")
 
// There is also sin, cos, tan, asin, acos, atan
// sinh, cosh, tanh

// ---------- CONDITIONALS ----------

// ----- IF / ELSE -----
 
// Comparison Operators : > < >= <= == !=
// === : Checks if pointing to same reference
// !== : Checks if don't point at same reference
 
var age2: Int = 8
 
if age2 < 5 {
    print("Go to Preschool")
} else if age2 == 5 {
    print("Go to Kindergarten")
} else if (age2 > 5) && (age <= 18){
    let grade: Int = age2 - 5
    print("Go to Grade \(grade)")
} else {
    print("Go to College")
}
 
// Or logical operator
var income: Double = 12000
var gpa: Double = 3.7
 
print("Get Grant : \((income < 15000) || (gpa >= 3.8))")
 
print("")
 
// Not operator
print("Not True : \(!true)")
 
// ----- TERNARY OPERATOR -----
// Assigns 1 of 2 values depending on condition
 
var canDrive: Bool = age >= 16 ? true : false
 
// ----- SWITCH -----
// Matches a limited number of values and doesn't all
// through after a match
 
let ingredient = "pasta"
 
switch ingredient {
    // Matches for tomatoes or pasta
    case "tomatoes", "pasta":
        print("Spaghetti")
        // fallthrough matches the next case even if
        // there is no match
    case "beans":
        print("Burrito")
    case "potatoes":
        print("Mashed Potatoes")
    default:
        print("Water")
}
 
// You can also match ranges
let testScore: Int = 89
        
switch testScore {
    case 93...100:
        print("You got an A")
    case 85...92:
        print("You got a B")
    case 77...84:
        print("You got a C")
    case 69...76:
        print("You got a D")
    default:
        print("You got an F")
}

// ---------- LOOPING ----------

// ----- FOR LOOP -----
 
// An array can contain multiple values
var a4 = [1,2,3]
 
// Iterate through array
for item in a4 {
    print(item)
}
 
// Iterate with a range
for i in 1...5 {
    print(i)
}
 
// ----- WHERE -----
// Print only evens
for i in 1...10 where i % 2 == 0 {
    print("Even : \(i)")
}

// Use stride to create even values from 10 to 2
for i in stride(from: 10, through:2, by: -2){
    print(i)
}

// Cycle through an array with forEach
a4.forEach{ print($0) }
 
// ----- WHILE LOOP -----
var i: Int = 1
while i < 10 {
    
    if i % 2 == 0 {
        i += 1
        
        // Continue jumps back to the beginning of the loop
        continue
    }
    
    if i == 7 {
        
        // Break ends the loop
        break
    }
    
    print(i)
    i += 1
}
 
// ----- REPEAT WHILE -----
 
// Generate a random number
let magicNum: Int = Int.random(in: 1...10)
var guess: Int = 0


repeat {
    print("Guess : \(guess)")
    guess += 1
} while (magicNum != guess)
 
print("Magic Number was \(magicNum)")
 
// Create an iterator that pops out the next value with next
var i1 = (1...5).makeIterator()
while let i = i1.next(){
    print(i)
}

// ---------- FUNCTIONS ----------

// Functions allow us to reuse and better organize our code

// Function that sums values passed and returns an int
func getSum(x:Int, y:Int) -> Int {
    return x + y
}
print("Sum : \(getSum(x:5, y:4))")

// If you don't want to provide the parameter labels do this
// You can provide default values if you want
func getSum2(_ x:Int=1, _ y:Int) -> Int {
    return x + y
}
print("Sum : \(getSum2(5, 4))")

// Mark a function as Void if it returns nothing
func printTwo() -> Void {
    print("Two")
}
printTwo()

// You can overload (have multiple functions with the same name)
// if they receive different parameter and return types
func getSum2(_ x:Double, _ y:Double) -> Double {
    return x + y
}
print("Sum : \(getSum2(5.4, 4.5))")

// To us Variadic Parameters means to except an unknown
// number of parameters in a function
func getSum3(_ numArr:Int ...) -> Int{
    var sum: Int = 0
    for i in numArr{
        sum += i
    }
    return sum
}
print("Sum : \(getSum3(1,2,3,4))")

// You can't change the values of parameters
// func changeMe(_ x: Int) -> Void{
//    x = 10
// }
//

// You can however create a new variable with the same name and
// change it
func changeMe(_ x: Int) -> Void{
    let x: Int = 10
    print("x : \(x)")
}
changeMe(5)

// We can also use inout to change it
func changeMe2(_ cNum: inout Int) -> Void{
    cNum = 10
    print("cNum : \(cNum)")
}
var cNum: Int = 5
// Add the ampersand to your variable
changeMe2(&cNum)
// The value also changes outside of the function
print("cNum : \(cNum)")

// Return multiple values
func twoMults(num: Int) -> (two: Int, three: Int){
    let two: Int = num * 2
    let three: Int = num * 3
    return (two, three)
}
 
let mults = twoMults(num: 2)
 
print("2 Mults : \(mults.two), \(mults.three)")

// Recursion is the act of a function that calls itself
func factorial(_ num: Int) -> Int{
    var result: Int = 0
    // Must have a condition were we don't
    // call for the function to execute
    if(num == 1) {
        return 1
    } else {
        result = num * factorial(num - 1)
        return result
    }
}
print("Fact of 4 = \(factorial(4))")

// 1st : result = 4 * factorial(3) = 4 * 6 = 24
// 2nd : result = 3 * factorial(2) = 3 * 2 = 6
// 3rd : result = 2 * factorial(1) = 2 * 1 = 2

// Functions can be assiged to variables and can be passed to
// be used in other functions and returned from functions
func multBy2(_ num: Int) -> Int{
    return num * 2
}
// Assign function to a variable
var timesTwo = multBy2
print("4 * 2 = \(timesTwo(4))")

// Pass a function into another function and return nothing
func runFunc(_ f:() -> ()) {
    f()
}
func print4() -> Void{
    print("4")
}
runFunc(print4)

// Pass a function that does return a value
func doMath(_ f: (Int) -> Int, _ x: Int) {
    print("Result : \(f(x))")
}
doMath(timesTwo, 4)

// Return a function
func funcMaker(val: Int) -> (Int) -> Int {
    func addVals(num1: Int) -> Int{
        return num1 + val
    }
    return addVals
}
let add4 = funcMaker(val: 4)
print("4 + 5 = \(add4(5))")

// ----- CLOSURES -----
// Closures are functions that don't require a name
// or function definition
 
// A closure that excepts and returns an Int
var square: (Int) -> (Int) = {
    num in
    return num * num
}
 
print("5 Quared : \(square(5))")
 
// Assign a closure to another variable
var squareCopy = square
print("5 Quared : \(squareCopy(5))")
 
// You can reference any values outside the closure
let numbers = [8,9,2,4,1,0,7]
 
// Create a function that returns a Bool stating
// if 1 value is greater then the other
 
let sortedNums = numbers.sorted(by: {
    x, y in x < y
})
 
for i in sortedNums{
    print(i)
}
 
// Square every item in an array with map
// map excepts a closure
 
let squaredNums = numbers.map {
    (num: Int) -> String in
    "\(num * num)"
}
 
print(squaredNums)

// ---------- RANGES ----------

// Ranges have a start and ending value
// a...c : Everything from a to c including c
let r1 = 1...3
for i in r1{
    print(i)
}
// a..<c : Everything from a to c, but not c
let r2 = 1..<3
for i in r2{
    print(i)
}

// You can combine ranges with for loops
for i in 5...10{
    print(i)
}

// Loop in reverse
for i in (5...10).reversed(){
    print(i)
}

// Check if value is in a range
print("5 in range : \((1...5).contains(5))")

// ---------- ARRAYS ----------

// Arrays contain multiple values of the same data type

// Make empty array
var array1 = [Int]()
 
// Check if array is empty
print("Empty \(array1.isEmpty)")
 
// Add value to array
array1.append(5)
 
// Add another item
array1 += [7, 9]
 
// Get array item
print("Index 1 : \(array1[1])")
 
// Change value at index
array1[0] = 4
 
// Insert at an index
array1.insert(10, at: 3)
 
// Remove item
array1.remove(at: 3)
 
// Change multiple values
array1[0...2] = [1,2,3]
 
// Length of array
print("Length : \(array1.count)")
 
// Fill array with a value
var array2 = Array(repeating: 0, count: 5)
 
// Combine arrays
var array3 = array1 + array2
 
// Iterate through an array
for item in array3 {
    print(item)
}
 
// Get index and value
for (index, value) in array3.enumerated() {
    print("\(index) : \(value)")
}

// Create an array using a range
var array4 = Array(1...6)

// Get a slice of an array
print("Array : \(array4[1...2])")

// Insert multiple values at an index
array4[1..<2] = [9, 8]
print("Array : \(array4)")

// Insert array but keep values
array4[1..<1] = [10, 11]
print("Array : \(array4)")

// Get index of value (The ! unwraps an optional to get the value)
print("11 Index : \(array4.firstIndex(of:11)!)")

// Check if array contains value
print("11? : \(array4.contains(11))")

// Get min and max value
print("Min : \(array4.min()!)")
print("Max : \(array4.max()!)")

// Sort array
array4.sort()

// Reverse sort
array4.sort{$0 > $1}

// Create an array of arrays
var array5 = [[1,2,3], [4,5,6], [7,8,9]]
print("Array : \(array5[1][0])")

// Flatten an array of arrays
var array6 = Array(array5.joined())

// Get odds only
print("Odds : \(array6.split{$0.isMultiple(of:2)})")

// Get evens
var array7 = array6.filter{$0.isMultiple(of:2)}
print(array7)

// Only keep values greater than 5
var array8 = array6.filter{$0>5}

// Check if values satisfy a condition
print("Less then 12 : \(array6.allSatisfy({$0 < 12}))")

// Create a new array by applying a function on each value
var array9 = array6.map{$0 * 2}
print(array8)

// Add all values in array
print("Sum : \(array9.reduce(0){$0 + $1})")

// ---------- DICTIONARIES ----------

// A dictionary is an unordered list of key value pairs

// Create empty dictionary
var dict1 = [Int: String]()
 
// Check if empty
print("Empty : \(dict1.isEmpty)")
 
// Create an item with index of 1
dict1[1] = "Paul Smith"
 
// Create a dictionary with a string key
var cust: [String: String] = ["1": "Sally Marks", "2": "Paul Marks"]
 
// Size of dictionary
print("Size : \(cust.count)")
 
// Add an item
cust["3"] = "Doug Holmes"
 
// Change a value
cust["3"] = "Doug Marks"
 
// Get a value
if let name = cust["3"] {
    print("Index 3 : \(name)")
}
 
// Remove a key value pair
cust["3"] = nil
 
// Iterate through a dictionary
for (key, value) in cust {
    print("\(key) : \(value)")
}

// ---------- STRINGS ----------

// Strings contain text and escape characters like
// \n : Newlines
// \t : Tabs
// \" : Escaped Double Quotes
// \' : Escaped Single Quotes
// \\ : Escaped Backslashes

var str3 = "A string\n"

// Multiline string
var str4 = """
Multiline
String
"""

// String interpolation allows you to set a variable
// in a string as we saw
var num2 = 1
print("Your #\(num2)")

// Combine strings
var str5 = "a random string " + "and here is another"

// Check if a string is empty
print("String Empty : \(str5.isEmpty)")

// Get number of characters
print("String Size : \(str5.count)")

// Get the first character
print("First : \(str5[str5.startIndex])")
 
// Get the 5th character by offsetting from the 1st index
// You can also use endIndex
let index5 = str5.index(str5.startIndex, offsetBy: 5)
print("5th : \(str5[index5])")

// str5.contains("s") returns true if the string contains s
print("s in String : \(str5.contains("s"))")

// You can check for multiple values
print("Vowels in String : \(str5.contains{"aeiou".contains($0)})")

// Leave only characters in the list
print("Only Vowels : \("Derek".filter{"aeiou".contains($0)})")

// Get the 1st 4 characters
print("1st 4 : \(String(str5.prefix(4)))")

// Split converts strings to an array using a space as a separator
// An array contains multiple values
let arr = str5.split{$0 == " "}
// This for loop cycles through values in the array
for i in arr{
    print(i)
}

// Remove a character at the 1st index
str5.remove(at: str5.startIndex)

// Insert a character at index 0
str5.insert("A", at: str5.startIndex)
print(str5)

// Insert a string at index 15
let index6 = str5.index(str5.startIndex, offsetBy: 15)
str5.insert(contentsOf: " is great", at: index6)
print(str5)

// Get a string at defined indexes
let index7 = str5.index(str5.startIndex, offsetBy: 23)
print("String : \(str5[index6...index7])")

// Replace a string in a range
let r3 = index6...index7
str5.replaceSubrange(r3, with: " is super")
print(str5)

// Delete a string in a range
str5.removeSubrange(r3)
print(str5)

// Capitalize
print("Capitalize : \("abc".capitalized)")

// ---------- TUPLE ----------

// Tuples can contain multiple values of different types
// Define a tuple with an Int and String
var t1 : (String, Int)

// Assign values
t1 = ("age", 45)

// Do the above on 1 line
var t2 : (String, Int) = ("age", 35)

// Assign values from a tuple
var sAge: String
var iAge: Int
(sAge, iAge) = t2
print(sAge)

// Get values by index
print("Tuple 0 : \(t2.0)")

// Change values
t2.0 = "money"

// You can assign labels to elements
var t3 : (city:String, state:String) = ("Ida", "OH")
print("Tuple State : \(t3.state)")

// ---------- SETS ----------

// Sets are an unordered list of unique elements
// Create an empty set
var sNums = Set<Int>()

// Add value to set
sNums.insert(1)

// Create set with an array
var sNums2: Set<Int> = [1, 2, 3]

// Values in set
print("Count : \(sNums2.count)")

// Check if empty
print("Empty : \(sNums2.isEmpty)")

// Remove a value
sNums2.remove(3)

// Check for a value
print("2 : \(sNums2.contains(2))")

// Add more values
sNums2.insert(5)

// Iterate a set
for i in sNums2 {
    print(i)
}

// ----- FILTER -----
// Used to filter out values in an array
let nums2 = [1,2,3,4,5,6]
 
let evenNums = nums2.filter{
    (num: Int) -> Bool in
    return num % 2 == 0
}
 
print(evenNums)
 
// ----- REDUCE -----
// Reduces array values into one value
let sum2 = nums2.reduce(0) {
    (x: Int, y: Int) -> Int in
    return x + y
}
 
print(sum2)
 
// ----- ENUMERATIONS -----
// Define types with a limited number of cases
 
enum Emotion {
    case joy
    case anger
    case fear
    case disgust
    case sad
}
 
var feeling = Emotion.joy
 
// change the value
feeling = .anger
 
// Check value
print("Angry : \(feeling == .anger)")

// ---------- OPTIONALS ----------

// Optionals are types that can either have or not have a value
// Variables can't contain a value of nil, but in situations
// in which you can't guarantee you'll have a value you can use
// optionals. Then the optional will have a value of nil up
// until a value is assigned

// Create an optional
var oName: String? = "Derek"

// Create an optional with a nil value
var oAge: Int? = nil

// Assigning a value
oAge = 45

// You can't use an optional string as if it is a string
// To get the string it contains you must check if it has
// a value and if so unwrap it with !
if oName != nil && oAge != nil {
    let uName: String = oName!
    let uAge: Int = oAge!
    print("Hello \(uName) \(uAge)")
}

// ---------- EXCEPTIONS ----------

// Define our error by defining a type of the Error protocol
 
enum DivisionError: Error{
    case DivideByZero
}
 
// Define we want the error to get thrown from the function
func divide(num1: Float, num2: Float) throws -> Float {
    guard num2 != 0.0 else {
        throw DivisionError.DivideByZero
    }
    return num1/num2
}
 
// Wrap code that could trigger an error in a do catch block
// catch the error and handle it
 
do {
    try divide(num1: 4, num2: 0)
} catch DivisionError.DivideByZero {
    print("Can't Divide by Zero")
}

// ---------- STRUCTS ----------

// A struct is an object type that is used every place in
// Swift including Strings, Ints, Range and way more

// Create a rectangle struct
struct Rectangle {
    // It can contain properties
    var height = 0.0
    var length = 0.0
    
    // You can include methods
    func area() -> Double{
        let area = height * length
        return area
    }
}
 
// Create a Rectangle
let myRect = Rectangle(height: 10.0, length: 5.0)
 
print("Area : \(myRect.height) * \(myRect.length) = \(myRect.area())")

// ---------- CLASSES ----------

// Classes differ from structs in one main way being that
// classes can inherit from other classes.

// I'll create a Warrior type and then we'll have a battle to
// the death
class Warrior{
    // These are the warriors properties
    var name: String = "Warrior"
    var health: Int = 100
    var attkMax: Int = 10
    var blockMax: Int = 10
    
    // Called every time you create a Warrior object
    init(_ name: String, _ health: Int, _ attkMax: Int, _ blockMax: Int){
        // self is used to refer to properties of an
        // object when we don't know the objects name
        self.name = name
        self.health = health
        self.attkMax = attkMax
        self.blockMax = blockMax
    }
    
    // Randomly calculates an attack amount
    func attack() -> Int{
        return Int.random(in: 1...self.attkMax)
    }
    // Randomly calculates block amount
    func block() -> Int{
        return Int.random(in: 1...self.blockMax)
    }
}

// The battle class is used to loop until a warrior dies
class Battle{
    func startFight(_ warrior1: Warrior, _ warrior2: Warrior){
        // Loops until a warrior dies giving each warrior
        // a chance to attack
        while true{
            if Battle.getAttkResult(warrior1, warrior2) == "Game Over"{
                print("Game Over")
                break
            }
            if Battle.getAttkResult(warrior2, warrior1) == "Game Over"{
                print("Game Over")
                break
            }
        }
    }
    
    // This method is static because it doesn't require self
    static func getAttkResult(_ warriorA: Warrior, _ warriorB: Warrior) -> String{
        let warriorAAttkAmt: Int = warriorA.attack();
        let warriorBBlockAmt: Int = warriorB.block();
        var dmg2WB: Int = warriorAAttkAmt - warriorBBlockAmt
        dmg2WB = dmg2WB <= 0 ? 0 : dmg2WB
        warriorB.health = warriorB.health - dmg2WB
        print("\(warriorA.name) attacks \(warriorB.name) and deals \(dmg2WB) damage")
        print("\(warriorB.name) is down to \(warriorB.health)")
        if warriorB.health <= 0{
            print("\(warriorB.name) has Died and \(warriorA.name) is Victorious!!!")
            return "Game Over"
        } else {
            return "Fight Again"
        }
    }
}

// Protocols are like interfaces in other languages
// When a class adopts a protocol it agrees to define
// the behavior the protocol describes
// We want to give Loki the ability to teleport
protocol Teleports {
    // You define the header for a func but nothing else
    func teleport() -> String
}

// Now we create classes that implement Teleports
class CanTeleport : Teleports{
    func teleport() -> String{
        return "Teleports Away"
    }
}

class CantTeleport : Teleports{
    func teleport() -> String{
        return "Fails at Teleporting"
    }
}

// Now we will inherit from Warrior and add on the additonal
// ability of teleporting using our Teleports protocol
class MagicWarrior : Warrior {
    // The bigger the number the more likely the chance
    // of successfully teleporting (100 Max Value)
    var teleportChance: Int = 0
    // Add protocol functionality
    var teleportType = CanTeleport()
    
    init(_ name: String, _ health: Int, _ attkMax: Int, _ blockMax: Int, _ teleportChance: Int){
        // Call the superclass init
        super.init(name, health, attkMax, blockMax)
        self.teleportChance = teleportChance
    }
    
    // We'll inherit all properties and methods in the Warrior
    // class but we'll override block
    override func block() -> Int {
        // Generate a random value from 1 to 100
        let rndDodge = Int.random(in: 1...100)
        // Decide if teleport works based on percent assigned to teleportChance
        if rndDodge < self.teleportChance{
            print(self.name + " " + teleportType.teleport())
            return 10000
        } else {
            // Call the block method in the super class
            return super.block()
        }
    }
}

// Thor is more powerful then Loki so let's treat him that way
let thor = Warrior("Thor", 80, 26, 10)
// let loki = Warrior("Loki", 50, 20, 10)

// Now Loki while not strong has the added ability of magic
let loki = MagicWarrior("Loki", 50, 20, 10, 50)
let battle = Battle()
battle.startFight(thor, loki)

// ---------- EXTENSIONS ----------

// Extensions add functionality to existing classes, enums, structs
// and protocols, but you can't override existing functions

// Extend the capabilities of the Double type so it can work
// with distances
extension Double {
    var km: Double { return self * 1000.0 }
    var m: Double { return self }
    var cm: Double { return self * 100.0 }
    var mm: Double { return self / 1000.0 }
    var ft: Double { return self / 3.28084 }
}

// Automatically convert millimeters to meters
let oneInch = 25.4.mm
print("1 inch is \(oneInch) meters")

// You can combine units
let marathon = 42.km + 195.m
print("A marathon is \(marathon) meters long")

// Now create a protocol that defines that any type that
// conforms to it must have the + operator
protocol Summable { static func +(x: Self, y: Self) -> Self }

// Define that Ints, Doubles and Strings conform to Summable
extension Int: Summable{}
extension Double: Summable{}
extension String: Summable{}

// ---------- GENERICS ----------

// A generic is a placeholder type in which the data type will be
// assigned later

// Let's make a function that can add Ints, Doubles and Strings
// using the generic parameter T and the type contraints defined
// previously
// We state as long as the data type is an Int, Double or String
// and the parameters and return type are of the same type we
// can add those values
func sum<T: Summable>(_ x: T, _ y: T) -> T {
    return x + y
}
print("5 + 4 = \(sum(5,4))")
print("5.4 + 4.5 = \(sum(5.4,4.5))")
print("5 + 4 = \(sum("5","4"))")
