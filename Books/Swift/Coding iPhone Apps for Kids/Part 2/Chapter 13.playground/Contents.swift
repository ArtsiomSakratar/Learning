import UIKit

var str = "Hello, playground"

var myDateComponents = DateComponents()
myDateComponents.month = 5
myDateComponents.day = 10
myDateComponents.year = 1971
myDateComponents.hour = 8
myDateComponents.minute = 23
let date = Calendar.current.date(from: myDateComponents)

let today = Date()
var myDateComponents2 = Calendar.current.dateComponents([.month, .day, .year], from: today)
myDateComponents2.hour = 8

let todayEightAm = Calendar.current.date(from: myDateComponents2)
