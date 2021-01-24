//
//  MemoStorageType.swift
//  RxMemo
//
//  Created by Keita on 2021/1/23.
//

import Foundation
import RxSwift

protocol MemoStorageType {
    // 忽略 (-> 回傳值)
    @discardableResult
    func createMemo(content: String) -> Observable<Memo>
    
    @discardableResult
    func memoliat() -> Observable<[Memo]>
    
    @discardableResult
    func update(memo: Memo, content: String) -> Observable<Memo>
    
    @discardableResult
    func delete(memo: Memo) -> Observable<Memo>
}
