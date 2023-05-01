//
//  Memo.swift
//  FirstMemo
//
//  Created by 김서영 on 2023/05/01.
//

import Foundation
import SwiftUI

class Memo: Identifiable, ObservableObject {
    let id : UUID //Identifiable이 요구하는 속성
    @Published var content: String //메모 저장하는 속성, Published 특성을 추가하면 새로운 값을 저장할 때 마다 바인딩 되어있는 UI가 자동 업데이트된다
    let insertDate: Date
    
    init(content: String, insertDate: Date = Date.now) {
        id = UUID()
        self.content = content
        self.insertDate = insertDate
    }
}
// class Memo에서는 두가지 프로토콜 채용, Identifiable : 데이터를 리스트에 쉽게 바인딩 하기 위해 필요 / ObservedObject : 메모 편집 시 뷰를 자동 업데이트 하기 위해 필요
