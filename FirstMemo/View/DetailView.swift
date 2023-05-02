//
//  DetailView.swift
//  FirstMemo
//
//  Created by 김서영 on 2023/05/02.
//

//여기선 목록에서 선택한 메모를 받고 디테일

import SwiftUI

struct DetailView: View {
    /*
     memo class를 보면 ObservableObject 프로토콜을 구현하고 있음
     그리고 그 안에 content 속성이 published로 선언되어있음
     
     ObservedObject로 선언하면 published로 선언된 속성이 바뀔때마다 view가 자동으로 update됨. 그래서 메모의 내용이 바뀌면 보기의 내용도 업데이트 되는것
     
     */
    @ObservedObject var memo: Memo
    
    @EnvironmentObject var store: MemoStore
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        Text(memo.content)
                            .padding()
                        Spacer(minLength: 0)
                    }
                    
                    Text(memo.insertDate, style: .date)
                        .padding()
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("메모보기")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(memo: Memo(content: "Hello"))
            .environmentObject(MemoStore())
    }
}
