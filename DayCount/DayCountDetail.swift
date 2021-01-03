//
//  DayCountDetail.swift
//  DayCount
//
//  Created by Maksym Saliuta on 01.01.2021.
//

import Foundation

let SFProFont = "SF Pro Rounded Bold"
let courgetteFont = "Courgette Regular"

struct DayCountDetail {
    var day: String
    var date: String
    var time: String
    var batteryPercentage: String
    
    static let dt = Date()
    static let calendar = Calendar.current
    
    static let data = DayCountDetail (
        day: calendar.weekdaySymbols[calendar.component(.weekday, from: dt) - 1],
        date: "\(calendar.component(.day, from: dt)) \(calendar.monthSymbols[calendar.component(.month, from: dt) - 1])",
        time: "\(calendar.component(.hour, from: dt)) \(calendar.component(.minute, from: dt))",
        batteryPercentage: "23%")
}
