//
//  DayCountView.swift
//  DayCount
//
//  Created by Maksym Saliuta on 01.01.2021.
//

import SwiftUI

struct DayCountView: View {
    var data: DayCountDetail
    
    let backgroundImage = "smallBackground"
    
    let dateFontSize = CGFloat(16.0)
    let dateFontKerning = CGFloat(0.16)
    
    let vstackSpasing = CGFloat(6.0)
    let vstackPadding = EdgeInsets(top: 15, leading: 13, bottom: 10, trailing: 0)
    
    let dayFontSize = CGFloat(25.0)
    let dayFontKerning = CGFloat(-1)
    
    let timeFontSize = CGFloat(57.0)
    let timeFontKerning = CGFloat(-2.16)
    let timeWidth = CGFloat(91.0)
    let timeForegroundColor = Color.white.opacity(0.6)
    let timeTrailingPadding = CGFloat(7.0)
    
    init(_ data: DayCountDetail) {
        self.data = data
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Image(backgroundImage)
            HStack {
                VStack(alignment: .leading, spacing: vstackSpasing) {
                    Text(data.date)
                        .kerning(dateFontKerning)
                        .foregroundColor(Color.white)
                        .font(.custom(SFProFont, size: dateFontSize))
                    Spacer()
                    BatteryView(data: data, color: Color(#colorLiteral(red: 0.623427093, green: 0.3781400025, blue: 0.8900634646, alpha: 1)))
                    Text(data.day)
                        .kerning(dayFontKerning)
                        .foregroundColor(Color.white).font(.custom(courgetteFont, size: dayFontSize))
                }
                .padding(vstackPadding)
                Spacer()
            }
            Spacer()
            Text(data.time)
                .kerning(timeFontKerning)
                .font(.custom(SFProFont, size: timeFontSize))
                .multilineTextAlignment(.trailing)
                .frame(width: timeWidth)
                .foregroundColor(timeForegroundColor)
                .lineLimit(nil)
                .lineSpacing(/*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                .padding(.trailing, timeTrailingPadding)
        }
    }
}

struct DayCountView_Previews: PreviewProvider {
    static var previews: some View {
        let viewHeight = CGFloat(148)
        let viewWidth = CGFloat(148)
        
        DayCountView(DayCountDetail.data).previewLayout(.fixed(width: viewWidth, height: viewHeight))
    }
}
