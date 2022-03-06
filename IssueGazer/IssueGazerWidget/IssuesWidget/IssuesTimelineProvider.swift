//
//  IssuesTimelineProvider.swift
//  IssueGazer
//
//  Created by maiyama on 2022/03/06.
//

import WidgetKit

struct IssuesEntry: TimelineEntry {
    let date: Date
    let configuration: IssuesSearchConfigurationIntent
}

struct IssuesTimelineProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> IssuesEntry {
        IssuesEntry(date: Date(), configuration: IssuesSearchConfigurationIntent())
    }

    func getSnapshot(for configuration: IssuesSearchConfigurationIntent, in context: Context, completion: @escaping (IssuesEntry) -> ()) {
        let entry = IssuesEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: IssuesSearchConfigurationIntent, in context: Context, completion: @escaping (Timeline<IssuesEntry>) -> ()) {
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

