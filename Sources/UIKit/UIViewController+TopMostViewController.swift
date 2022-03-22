//
//  UIViewController+TopMostViewController.swift
//  SwiftToolkit
//
//  Created by Mikhail on 02.02.2021.
//

import UIKit

public extension UIViewController {
    
    func topMostViewController() -> UIViewController {
        
        if let presentedViewController = presentedViewController {
            return presentedViewController.topMostViewController()
        }
        
        if let navigationController = self as? UINavigationController {
            return navigationController.visibleViewController?.topMostViewController() ?? navigationController
        }
        
        if let tabBarController = self as? UITabBarController {
            return tabBarController.selectedViewController?.topMostViewController() ?? tabBarController
        }
        
        return self
    }
}

public extension UIApplication {
    
    var topMostViewController: UIViewController? {
        return keyWindow?.rootViewController?.topMostViewController()
    }
}

