//
//  TransitionModel.swift
//  RxMemo
//
//  Created by Keita on 2021/1/24.
//

import Foundation

enum TransitionStyle {
    case root
    case push
    case modal
}

enum transitionError: Error {
    case navigationControolerMissing
    case cannotPop
    case unknown
}
