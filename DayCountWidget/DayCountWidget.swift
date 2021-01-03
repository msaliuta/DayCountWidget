//
//  DayCountWidget.swift
//  DayCountWidget
//
//  Created by Maksym Saliuta on 02.01.2021.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), data: .data)
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), data: .data)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, data: .data)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let data: DayCountDetail
}

struct DayCountWidgetEntryView : View {
    var entry: Provider.Entry
    
    @Environment(\.widgetFamily) var family
    
    @ViewBuilder
    
    var body: some View {
        switch family {
        case .systemSmall:
            DayCountView(.data)
        case .systemMedium:
            MediumDayCountView(.data)
        case .systemLarge:
            LargeDayCountView(.data)
        default:
            Text("Hello, world! 23")
        }
    }
}

@main
struct DayCountWidget: Widget {
    let kind: String = "DayCountWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            DayCountWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Day Count Widget")
        .description("This is a widget that displays time, date, day and your battery state.")
    }
}

struct DayCountWidget_Previews: PreviewProvider {
    static var previews: some View {
        
        DayCountWidgetEntryView(entry: SimpleEntry(date: Date(), data: .data))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        DayCountWidgetEntryView(entry: SimpleEntry(date: Date(), data: .data))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
        DayCountWidgetEntryView(entry: SimpleEntry(date: Date(), data: .data))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
