//
//  UIViewControllerExtension.swift
//  SCInstagram
//
//  Created by user on 28.11.2021.
//

import UIKit
import SVProgressHUD

enum TypeHUD {
    case loading
    case dismiss
    case error(text: String? = nil)
    case success(text: String? = nil)
    case info(text: String? = nil)
}

extension UIViewController {
    
    func showHUD(_ type: TypeHUD = .loading) {
        switch type {
        case .loading:
            view.isUserInteractionEnabled = false
            navigationItem.leftBarButtonItem?.isEnabled = false
            navigationItem.rightBarButtonItem?.isEnabled = false
            SVProgressHUD.show()
        case .dismiss:
            view.isUserInteractionEnabled = true
            navigationItem.leftBarButtonItem?.isEnabled = true
            navigationItem.rightBarButtonItem?.isEnabled = true
            SVProgressHUD.dismiss()
        case .error(let text):
            view.isUserInteractionEnabled = true
            navigationItem.leftBarButtonItem?.isEnabled = true
            navigationItem.rightBarButtonItem?.isEnabled = true
            SVProgressHUD.showError(withStatus: text)
        case .success(let text):
            view.isUserInteractionEnabled = true
            navigationItem.leftBarButtonItem?.isEnabled = true
            navigationItem.rightBarButtonItem?.isEnabled = true
            SVProgressHUD.showSuccess(withStatus: text)
        case .info(let text):
            view.isUserInteractionEnabled = true
            navigationItem.leftBarButtonItem?.isEnabled = true
            navigationItem.rightBarButtonItem?.isEnabled = true
            SVProgressHUD.showInfo(withStatus: text)
        }
    }
    
}
