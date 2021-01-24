//
//  Memo.swift
//  RxMemo
//
//  Created by Keita on 2021/1/23.
//

import Foundation

struct Memo: Equatable {
    var content: String
    var insertDate: Date
    var identity: String
    
    init(content: String, insertDate: Date = Date()) {
        self.content = content
        self.insertDate = insertDate
        self.identity = "\(insertDate.timeIntervalSinceReferenceDate)"
    }
    
    // 創建新的便簽時的實例
    init(original: Memo, updatedContent: String) {
        self = original
        self.content = updatedContent
    }
}
