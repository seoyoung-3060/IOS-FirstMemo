//
//  ComposeView.swift
//  FirstMemo
//
//  Created by 김서영 on 2023/05/01.
//

import SwiftUI

struct ComposeView: View {
    @EnvironmentObject var store: MemoStore //memostore속성 선언
    
    @Environment(\.dismiss) var dismiss
    
    //입력한 text를 binding하는데 필요한 속성추가 == state variable
    @State private var content: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $content) //content속성과 texteditor이 바인딩됨. 입력한 내용이 content속성에 자동저장됨. 반대로 content에 문자열 입력한 것도 texteditor에도 동일하게 표시됨. 이를 two-way binding이라함
                    .padding()
            }
            .navigationTitle("new memo")
            .navigationBarTitleDisplayMode(.inline) //large title mode 사용X
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) { //default button:오른쪽, 이거추가해서 왼쪽으로 옮김
                    Button {
                        dismiss() //button 누르면 화면 닫기를 dismiss로 구현함
                    } label: {
                        Text("cancel") //button title
                    }

                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        store.insert(memo: content)
                        dismiss()
                    } label: {
                        Text("save")
                    }

                }
            }
        }
    }
}

struct ComposeView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeView()
            .environmentObject(MemoStore()) //memostore을 custom공유데이터로 등록
    }
}
