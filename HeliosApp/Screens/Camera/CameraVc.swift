//
//  CameraVc.swift
//  HeliosApp
//
//  Created by Pavel Mac on 20/09/24.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

class CameraVc: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        openCamera()
    }
    
    private func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            self.showAlertMessage(title: "Camera Not Available", message: "Sorry, camera is not available on this device.") {
                self.tabBarController?.tabBar.isHidden = false
                self.tabBarController?.selectedIndex = 3
            }
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.tabBarController?.tabBar.isHidden = false
        self.tabBarController?.selectedIndex = 3
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print(info)
    }
}


