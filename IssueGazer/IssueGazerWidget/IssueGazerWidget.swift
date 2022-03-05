//
//  IssueGazerWidget.swift
//  IssueGazerWidget
//
//  Created by maiyama on 2022/03/05.
//

import WidgetKit
import SwiftUI
import Intents

struct IssuesTimelineProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> IssuesEntry {
        IssuesEntry(date: Date(), configuration: IssuesSearchConfigurationIntent())
    }

    func getSnapshot(for configuration: IssuesSearchConfigurationIntent, in context: Context, completion: @escaping (IssuesEntry) -> ()) {
        let entry = IssuesEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: IssuesSearchConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [IssuesEntry] = []

        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = IssuesEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct IssuesEntry: TimelineEntry {
    let date: Date
    let configuration: IssuesSearchConfigurationIntent
}

struct IssueGazerWidgetEntryView : View {
    var entry: IssuesTimelineProvider.Entry

    var body: some View {
        VStack {
            Text(entry.date, style: .time)
            Text(entry.configuration.query?.displayString ?? "")
        }
    }
}

@main
struct IssueGazerWidget: Widget {
    let kind: String = "IssueGazerWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: IssuesSearchConfigurationIntent.self, provider: IssuesTimelineProvider()) { entry in
            IssueGazerWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct IssueGazerWidget_Previews: PreviewProvider {
    static var previews: some View {
        IssueGazerWidgetEntryView(entry: IssuesEntry(date: Date(), configuration: IssuesSearchConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
