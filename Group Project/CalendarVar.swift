
import Foundation

var date = Date();
var cal = Calendar.current


var day = cal.component(.day, from: date)
var weekday = cal.component(.weekday, from: date) - 1
var month = cal.component(.month, from: date) - 1
var year = cal.component(.year, from: date)

