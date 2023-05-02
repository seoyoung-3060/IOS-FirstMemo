//
//  MemoCell.swift
//  FirstMemo
//
//  Created by 김서영 on 2023/05/01.
//

import SwiftUI


struct MemoCell: View {
    @ObservedObject var memo: Memo
    var body: some View {
        VStack(alignment: .leading) { //verticalStack의 준말
            //alignment: .leading 왼쪽정렬
            Text(memo.content)
                .font(.body)
                .lineLimit(1) //메모내용을 한줄만 보여주고 뒷부분은 ...로 생략처리
            Text(memo.insertDate, style: .date)
                .font(.caption) //caption
                .foregroundColor(.secondary)
        }
    }
}

struct MemoCell_Previews: PreviewProvider {
    static var previews: some View {
        MemoCell(memo: Memo(content: "Test")) //여기엔 그냥 더미데이터를 전달하면됨
    }
}
