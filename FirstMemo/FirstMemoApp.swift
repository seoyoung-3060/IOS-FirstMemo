//
//  FirstMemoApp.swift
//  FirstMemo
//
//  Created by 김서영 on 2023/05/01.
//

import SwiftUI

@main
struct FirstMemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
