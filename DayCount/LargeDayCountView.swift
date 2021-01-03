//
//  LargeDayCountView.swift
//  DayCount
//
//  Created by Maksym Saliuta on 03.01.2021.
//

import SwiftUI

struct LargeDayCountView: View {
    var data: DayCountDetail
    
    let backgroundImage = "largeBackground"
    
    let dateFontSize = CGFloat(24.0)
    let dateFontKerning = CGFloat(0.16)
    
    let vstackSpasing = CGFloat(6.0)
    let vstackPadding = EdgeInsets(top: 15, leading: 13, bottom: 17, trailing: 16)
    
    let dayFontSize = CGFloat(44.0)
    let dayFontKerning = CGFloat(-1)
    
    let timeFontSize = CGFloat(120)
    let timeFontKerning = CGFloat(-4.79)
    let timeForegroundColor = Color.white.opacity(0.6)
    let timePadding = EdgeInsets(top: 22, leading: 0, bottom: 18, trailing: 11)
    let timeMinimumScaleFactor = CGFloat(0.8)
    
    init(_ data: DayCountDetail) {
        self.data = data
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Image(backgroundImage)
            HStack {
                VStack(alignment: .leading, spacing: vstackSpasing) {
                    HStack {
                        Text(data.date)
                            .kerning(dateFontKerning)
                            .foregroundColor(Color.white)
                            .font(.custom(SFProFont, size: dateFontSize))
                        Spacer()
                        BatteryView(data: data, color: Color(#colorLiteral(red: 0.997651875, green: 0.6343511939, blue: 0.372243464, alpha: 1)))
                    }
                    Spacer()
                    Text(data.day)
                        .foregroundColor(Color.white).font(.custom(courgetteFont, size: dayFontSize))
                }
                .padding(vstackPadding)
            }
            Text(data.time)
                .kerning(timeFontKerning)
                .font(.custom(SFProFont, size: timeFontSize))
                .foregroundColor(timeForegroundColor)
                .minimumScaleFactor(timeMinimumScaleFactor)
                .padding(timePadding)
                .lineSpacing(0)
        }
    }
}

struct LargeDayCountView_Previews: PreviewProvider {
    static var previews: some View {
        let viewHeight = CGFloat(328)
        let viewWidth = CGFloat(312)
        
        LargeDayCountView(.data).previewLayout(.fixed(width: viewWidth, height: viewHeight))
    }
}
