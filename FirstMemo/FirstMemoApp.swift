//
//  FirstMemoApp.swift
//  FirstMemo
//
//  Created by 김서영 on 2023/05/01.
//

import SwiftUI

@main
struct FirstMemoApp: App {
    @StateObject var store = MemoStore() //메모 저장소를 속성으로 저장
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(store) //mainlistview, 이어진 view에서 동일한 객체 사용가능
        }
    }
}
