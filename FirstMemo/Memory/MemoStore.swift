//
//  MemoStore.swift
//  FirstMemo
//
//  Created by 김서영 on 2023/05/01.
//
// 메모 목록을 저장하는 class 구현
import Foundation

class MemoStore: ObservableObject {
    @Published var list: [Memo]
    
    init() {
        list = [
            Memo(content: "Hello", insertDate: Date.now),
            Memo(content: "Awesome", insertDate: Date.now.addingTimeInterval(3600 * -24)),
            Memo(content: "SwiftUI", insertDate: Date.now.addingTimeInterval(3600 * -48))
        ]
    }
    
    func insert(memo: String) {
        //입력한 데이터를 parameter로 받은 뒤 리스트로 저장할거임
        list.insert(Memo(content: memo), at: 0) //새로운 메모는 항상 0번에 추가되도록 -> 항상 위에 뜸
    }
    
    func update(memo: Memo?, content: String) {
        guard let memo = memo else {
            return
        }
        //guard?
        //?연산자 :
        
        memo.content = content
    }
    
    func delete(memo: Memo) {
        list.removeAll { $0.id == memo.id }

    }
    
    func delete(set: IndexSet) {
        for index in set {
            list.remove(at: index)
        }
    }
}
