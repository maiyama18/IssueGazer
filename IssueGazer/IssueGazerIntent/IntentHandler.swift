//
//  IntentHandler.swift
//  IssueGazerIntent
//
//  Created by maiyama on 2022/03/05.
//

import Intents

class IntentHandler: INExtension {}

extension IntentHandler: IssuesSearchConfigurationIntentHandling {
    func provideQueryOptionsCollection(for intent: IssuesSearchConfigurationIntent) async throws -> INObjectCollection<
        Query
    > {
        let query1 = Query(identifier: "query1", display: "My Issues")
        query1.text = "query 1"
        let query2 = Query(identifier: "query2", display: "Assigned Issues")
        query2.text = "query 2"
        return INObjectCollection(items: [query1, query2])
    }
}
