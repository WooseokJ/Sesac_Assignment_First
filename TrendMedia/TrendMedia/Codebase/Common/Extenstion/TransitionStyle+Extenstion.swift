//
//  TransitionStyle.swift
//  TrendMedia
//
//  Created by useok on 2022/08/25.
//

import Foundation
import UIKit

extension UIViewController {
    enum TransitionStyle {
        case present //네비없음
        case presentNavigation //네비있음
        case presentFullNavigation // 네비 + 풀스크린
        case push
    }
    
    func transition<T: UIViewController>(_ viewController: T, transitionStyle: TransitionStyle = .present) {
        let nav = UINavigationController(rootViewController: viewController)
        
        switch transitionStyle {
        case .present:
            self.present(viewController,animated: true)
        case .presentNavigation:
            self.present(nav,animated: true)
        case .presentFullNavigation:
            nav.modalPresentationStyle = .fullScreen
            self.present(nav,animated: true)
        case .push:
            nav.pushViewController(viewController, animated: true)
        }
    }
    
}
