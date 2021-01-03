//
//  BatteryView.swift
//  DayCount
//
//  Created by Maksym Saliuta on 03.01.2021.
//

import SwiftUI

struct BatteryView: View {
   
   let data: DayCountDetail
   let textColor: Color
   
   let viewHeight = CGFloat(22.0)
   let viewWidth = CGFloat(40.0)
   
   let textFontSize = CGFloat(12.0)
   let textKerning = CGFloat(-0.12)
   
   let rectangleHeight = CGFloat(18.0)
   let rectangleWidth = CGFloat(30.0)
   
   let batteryImageName = "battery"
   
   init(data: DayCountDetail? = DayCountDetail.data, color: Color?) {
      self.data = data ?? DayCountDetail.data
      self.textColor = color ?? Color(#colorLiteral(red: 0.623427093, green: 0.3781400025, blue: 0.8900634646, alpha: 1))
   }
   
   var body: some View {
      ZStack {
         Rectangle()
            .frame(width: rectangleWidth, height: rectangleHeight)
            .foregroundColor(.white)
         Text(BatteryView.battery)
            .kerning(textKerning)
            .foregroundColor(textColor)
            .font(.custom(SFProFont, size: textFontSize))
            .multilineTextAlignment(.leading)
            
      }
      .background(Image(batteryImageName))
      .frame(width: viewWidth, height: viewHeight)
   }
   
   static let battery: String = {
      UIDevice.current.isBatteryMonitoringEnabled = true
      let batteryPercentage = "\(Int(UIDevice.current.batteryLevel * 100))%"
      return batteryPercentage
   }()
}

struct BatteryView_Previews: PreviewProvider {
   
   static var previews: some View {
      let viewHeight = CGFloat(22)
      let viewWidth = CGFloat(40)
      
      BatteryView(color: .black).previewLayout(.fixed(width: viewWidth, height: viewHeight))
   }
}
