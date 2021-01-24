//
//  Scene.swift
//  RxMemo
//
//  Created by Keita on 2021/1/24.
//

import UIKit

enum Scene {
    case list(MemoListViewModel)
    case detail(MemoDetailViewModel)
    case compose(MemoComposeViewModel)
}

extension Scene {
    
     func instantiate(from storyboard: String = "Main") -> UIViewController {
        
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        
        switch self {
        case .list(let viewModel):
            guard let nav = storyboard.instantiateViewController(withIdentifier: "ListVC") as? UINavigationController else {
                fatalError()
            }
            
            guard let listVC = nav.viewControllers.first as? MemoListViewController else {
                fatalError()
            }
            
            listVC.bind(viewModel: )
            )
            
            return nav
        
        case .detail(let viewModel):
            guard let nav = storyboard.instantiateViewController(withIdentifier: "DatailVC") as? UINavigationController else {
                fatalError()
            }
            
            guard let detailVC = nav.viewControllers.first as? MemoDetailViewController else {
                fatalError()
            }
            
            detailVC.bind(viewModel: viewModel)
            
            return nav
        
        case .compose(let viewModel):
            
            guard let nav = storyboard.instantiateViewController(withIdentifier: "ComposeVC") as? UINavigationController else {
                fatalError()
            }
            
            guard let composeVC = nav.viewControllers.first as? MemoComposeViewController else {
                fatalError()
            }
            
            composeVC.bind(viewModel: viewModel)
            
            return nav
        }
        
    }
}
