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
    
    //쓰기누르면 편집 화면 모달로 표시할거임. 표시화면은 쓰기화면 표시 방법과 같음 = boolean속성필요
    @State private var showComposer = false
    @State private var showDeleteAlert = false
    
    @Environment(\.dismiss) var dismiss
    
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
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button {
                    showDeleteAlert = true
                } label: {
                    Image(systemName: "trash")
                }
                .foregroundColor(.red)
                .alert("DeleteConfirm", isPresented: $showDeleteAlert) {
                    Button(role: .destructive) {
                        store.delete(memo: memo)
                        dismiss()
                    } label: {
                        Text("delete")
                    }
                    //role을 destructive에 저장하는 이유 : content에 맞게 적절한 위치에 표시되기 때문 + 컬러를 따로 지정안해도 빨간색으로 표시됨
                } message: {
                    Text("Do you want to Delete?")
                } //cancel 버튼은 자동으로 추가돼서 직접 추가할필요X
                Button {
                    showComposer = true
                } label: {
                    Image(systemName: "square.and.pencil")
                }

            }
        }
        .sheet(isPresented: $showComposer) {
            ComposeView(memo: memo) //initializer로 memo 전달
        }
    }
}

//미리보기
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(memo: Memo(content: "Hello"))
                .environmentObject(MemoStore())
        }
    }
}
