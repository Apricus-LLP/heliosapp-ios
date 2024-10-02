//
//  UIViewController+Extension.swift
//  HeliosApp
//
//  Created by Pavel Mac on 25/09/24.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

extension UIViewController {
    func getWindow() -> UIWindow? {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        return window
    }
    
    func showAlertMessage(title: String = "", message: String = "",handler: (()->Void)? = nil) {
        let alertMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel) {_ in
            if let handler {
                handler()
            }
        }
        alertMessage.addAction(ok)
        self.present(alertMessage, animated: true)
    }
}
