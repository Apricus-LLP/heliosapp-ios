//
//  Constants.swift
//  HeliosApp
//
//  Created by Pavel Mac on 02/10/24.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addBottomBorderView(color: UIColor) {
        let bottomline = CALayer()
        bottomline.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        bottomline.backgroundColor = color.cgColor
        self.layer.addSublayer(bottomline)
    }
}

extension UITextField {
    func addBottomBorderTF() {
        let bottomline = CALayer()
        bottomline.frame = CGRect(x: 0, y: self.frame.size.height-1, width: self.frame.size.width, height: 1)
        bottomline.backgroundColor = UIColor.orange.cgColor
        self.borderStyle = .none
        self.layer.addSublayer(bottomline)
    }
}

extension UIViewController {
    func alertMessage(message: String) {
        let alert = UIAlertController(title: "Helios", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

func setProfileImg(_ image: UIImage, forKey key: String) {
    if let data = image.pngData() {
        UserDefaults.standard.setValue(data, forKey: key)
    }
}

func getProfileImg(forKey key: String) -> UIImage? {
    if let data = UserDefaults.standard.value(forKey: key) {
        return UIImage(data: data as! Data)
    }
    return UIImage(named: "person")
}

func setupBtnGreenBgAndLabel(btn: UIButton) {
    btn.tintColor = UIColor.darkGray
    btn.backgroundColor = UIColor.green
}

func setupBtnGreyBgAndLabel(btn: UIButton) {
    btn.tintColor = UIColor.gray
    btn.backgroundColor = UIColor.darkGray
}

func getHapticFeedback() {
    let haptic = UIImpactFeedbackGenerator(style: .heavy)
    haptic.impactOccurred()
}
