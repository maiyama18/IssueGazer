//
//  IssuesWidget.swift
//  IssueGazer
//
//  Created by maiyama on 2022/03/06.
//

import Intents
import SwiftUI
import WidgetKit

struct IssuesWidget: Widget {
    let kind: String = "IssuesWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(
            kind: kind, intent: IssuesSearchConfigurationIntent.self, provider: IssuesTimelineProvider()
        ) { entry in
            IssuesWidgetView(entry: entry)
        }
        .configurationDisplayName("Issues")
        .description("This is an issues widget.")
    }
}

struct IssuesWidgetView: View {
    var entry: IssuesTimelineProvider.Entry

    var body: some View {
        VStack {
            Text(entry.date, style: .time)
            Text(entry.configuration.query?.displayString ?? "")
        }
    }
}
