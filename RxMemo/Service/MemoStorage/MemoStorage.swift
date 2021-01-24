//
//  MemoStorage.swift
//  RxMemo
//
//  Created by Keita on 2021/1/24.
//

import Foundation
import RxSwift

class MemoStorage: MemoStorageType {
    
    private var list = [
        Memo(content: "Hello RxSwift", insertDate: Date().addingTimeInterval(-10)),
        Memo(content: "Hello world", insertDate: Date().addingTimeInterval(-20))
    ]
    
    private lazy var store = BehaviorSubject<[Memo]>(value: list)
    
    @discardableResult
    func createMemo(content: String) -> Observable<Memo> {
        // 創建一個新的
        let memo = Memo(content: content)
        // 插入新增資料到資料群
        list.insert(memo, at: 0)
        // 資料庫更新動作
        store.onNext(list)
        
        return Observable.just(memo)
    }
    
    @discardableResult
    func memoliat() -> Observable<[Memo]> {
        return store
    }
    
    @discardableResult
    func update(memo: Memo, content: String) -> Observable<Memo> {
        let updated = Memo(original: memo, updatedContent: content)
        
        // 先刪除再插入
        if let index = list.firstIndex(where: { $0 == memo }) {
            list.remove(at: index)
            list.insert(updated, at: index)
        }
        // call 更新
        store.onNext(list)
        // 回傳更新值
        return Observable.just(updated)
    }
    
    @discardableResult
    func delete(memo: Memo) -> Observable<Memo> {
        
        if let index = list.firstIndex(where: { $0 == memo }) {
            list.remove(at: index)
        }
        
        // call 更新
        store.onNext(list)
        
        // 回傳更新值
        return Observable.just(memo)
    }
    
    
}
