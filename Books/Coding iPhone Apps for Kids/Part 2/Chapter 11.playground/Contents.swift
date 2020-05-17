import UIKit

var str = "Hello, playground"

let today = Date()
print(today)

let formatter = DateFormatter()
formatter.dateStyle = DateFormatter.Style.full
formatter.string(from: today)

formatter.dateFormat = "MM/dd"
formatter.string(from: today)

formatter.dateFormat = "MM/dd/yyyy"
formatter.string(from: today)

formatter.dateFormat = "MM.dd.yy"
formatter.string(from: today)
formatter.dateFormat = "dd-MMM-yyyy"
formatter.string(from: today)
formatter.dateFormat = "EEE MMM dd"
formatter.string(from: today)
formatter.dateFormat = "EEEE-*-MMMM dd-*-yyyy"
formatter.string(from: today)

