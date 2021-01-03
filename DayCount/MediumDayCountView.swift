//
//  MediumDayCountView.swift
//  DayCount
//
//  Created by Maksym Saliuta on 03.01.2021.
//

import SwiftUI

struct MediumDayCountView: View {
    var data: DayCountDetail
    
    let backgroundImage = "mediumBackground"
    
    let dateFontSize = CGFloat(16.0)
    let dateFontKerning = CGFloat(0.16)
    
    let vstackSpasing = CGFloat(6.0)
    let vstackPadding = EdgeInsets(top: 15, leading: 16, bottom: 11, trailing: 16)
    
    let dayFontSize = CGFloat(32.0)
    let dayFontKerning = CGFloat(-1)
    
    let timeFontSize = CGFloat(92)
    let timeFontKerning = CGFloat(-2.16)
    let timeForegroundColor = Color.white.opacity(0.6)
    let timePadding = EdgeInsets(top: 22, leading: 0, bottom: 18, trailing: 11)
    let timeTrailingPadding = CGFloat(7.0)
    
    init(_ data: DayCountDetail) {
        self.data = data
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            Image(backgroundImage)
            HStack {
                VStack(alignment: .leading, spacing: vstackSpasing) {
                    HStack {
                        Text(data.date)
                            .kerning(dateFontKerning)
                            .foregroundColor(Color.white)
                            .font(.custom(SFProFont, size: dateFontSize))
                        Spacer()
                        BatteryView(data: data, color: Color(#colorLiteral(red: 0.9280578494, green: 0.8118510842, blue: 0.4727725983, alpha: 1)))
                    }
                    Spacer()
                    Text(data.day)
                        .kerning(dayFontKerning)
                        .foregroundColor(Color.white).font(.custom(courgetteFont, size: dayFontSize))
                }
                .padding(vstackPadding)
            }
            Spacer()
            Text(data.time)
                .kerning(timeFontKerning)
                .font(.custom(SFProFont, size: timeFontSize))
                .multilineTextAlignment(.trailing)
                .foregroundColor(timeForegroundColor)
                .lineLimit(1)
                .lineSpacing(/*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                .padding(.trailing, timeTrailingPadding)
        }
    }
}

struct MediumDayCountView_Previews: PreviewProvider {
    static var previews: some View {
        let viewHeight = CGFloat(148)
        let viewWidth = CGFloat(312)
        
        MediumDayCountView(.data).previewLayout(.fixed(width: viewWidth, height: viewHeight))
    }
}
