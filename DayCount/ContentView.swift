//
//  ContentView.swift
//  DayCount
//
//  Created by Maksym Saliuta on 01.01.2021.
//

import SwiftUI

struct ContentView: View {
    
    let titleText = "Day count widget"
    let titleTextForegroundColor = Color.white.opacity(0.9)
    let titleTextScaleFactor = CGFloat(0.25)
    
    let signatureText = "by msaliuta"
    
    let textForegroundColor = Color.white.opacity(0.8)
    let textScaleFactor = CGFloat(0.5)
    
    let cornerRadiusSize = CGFloat(20)
    
    let smallWidgetText = "Small Widget"
    let smallWidgetHeight = CGFloat(148)
    let smallWidgetWidth = CGFloat(148)
    
    let mediumWidgetText = "Medium Widget"
    let mediumWidgetHeight = CGFloat(149)
    let mediumWidgetWidth = CGFloat(312)
    
    let largeWidgetText = "Large Widget"
    let largeWidgetHeight = CGFloat(328)
    let largeWidgetWidth = CGFloat(312)
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.007666890044, green: 0.2549219728, blue: 0.4142872095, alpha: 1)).edgesIgnoringSafeArea(.all)
            ScrollView(.vertical) {
                VStack {
                    Text(titleText)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .foregroundColor(titleTextForegroundColor)
                        .minimumScaleFactor(titleTextScaleFactor)
                    Text(signatureText)
                    Spacer()
                    Text(smallWidgetText)
                        .font(.title)
                        .foregroundColor(textForegroundColor)
                        .minimumScaleFactor(textScaleFactor)
                    DayCountView(.data)
                        .frame(width: smallWidgetWidth, height: smallWidgetHeight, alignment: .leading)
                        .cornerRadius(cornerRadiusSize)
                    Text(mediumWidgetText)
                        .font(.title)
                        .foregroundColor(textForegroundColor)
                        .minimumScaleFactor(textScaleFactor)
                    MediumDayCountView(.data)
                        .frame(width: mediumWidgetWidth, height: mediumWidgetHeight)
                        .cornerRadius(cornerRadiusSize)
                    Text(largeWidgetText)
                        .font(.title)
                        .foregroundColor(textForegroundColor)
                        .minimumScaleFactor(textScaleFactor)
                    LargeDayCountView(.data)
                        .frame(width: largeWidgetWidth, height: largeWidgetHeight)
                        .cornerRadius(cornerRadiusSize)
                }.padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
