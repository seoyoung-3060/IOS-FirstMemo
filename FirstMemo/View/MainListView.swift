//
//  MainListView.swift
//  FirstMemo
//
//  Created by 김서영 on 2023/05/01.
//

//가독성을 위해 View는 가능한 잘게 쪼개는 것이 좋음

import SwiftUI

struct MainListView: View {
    @EnvironmentObject var store: MemoStore //MemoStore 인스턴스를 custom공유데이터로 등록했기때문에 view가 생성되는 시점에 공유데이터 목록 확인해서 동일한 속성의 인스턴스가 등록되어있다면 속성을 해당 인스턴스로 자동초기화해줌 -> 하나의 데이터를 여러 view에서 공유하고 싶을때 이용
    @State private var showComposer: Bool = false
    
    var body: some View {
        NavigationView { //shift+cmd+A : action추가
            //swiftUI는 modifierUI이라는 method를 이용해 필요한 속성을 바꾸거나 view를 조작함
            List(store.list) { memo in
                MemoCell(memo: memo)
            } //memostore에 있는 파라미터를 list로 전달,Text로 메모내용표시
            //.listStyle(.plain) //리스트 스타일이 여백없이 꽉채움
            .navigationTitle("My Memo")
            .toolbar {
                Button {
                    showComposer = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showComposer) { //showcomposer전달할건데 함수가 binding타입이라 $를 붙여줘야함
                ComposeView()
            } //sheet modifier은 binding한 속성에 true가 전달되면 클로저를 실행하고 클로저에서 return한 view를 모달방식으로 보여줌
        }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(MemoStore()) //preview에서 사용할 custom데이터 미리 등록해놓기
    }
}
