//
//  ProfileInfoVc.swift
//  HeliosApp
//
//  Created by Pavel Mac on 12/10/24.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

class ProfileInfoVc: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var nameCharCountLabel: UILabel!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var profileBtn: UIButton!
    @IBOutlet weak var userProfileImg: UIImageView!
    @IBOutlet weak var defaultProfileImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        profileBtn.setTitle("", for: .normal)
        setupImg()
        nameView.addBottomBorderView(color: UIColor.systemOrange)
        setupNameView()
    }
    
    
    @IBAction func profileImgBtn(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.sourceType = .photoLibrary
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        guard let name = nameTF.text, !name.isEmpty else {
          alertMessage(message: "Name cannot be empty.")
          return
        }
        
        if nameCharCountLabel.textColor == UIColor.red {
          alertMessage(message: "Name must be under 25 characters.")
        } else {
          let storyboard = UIStoryboard(name: "TabBarVc", bundle: nil)
  //        if let vc = storyboard.instantiateViewController(withIdentifier: "TabBarVc") as? TabBarVc {
  //          vc.modalPresentationStyle = .fullScreen
  //          self.present(vc, animated: true, completion: nil)
  //        }
        }
    }
    
    func setupImg() {
        defaultProfileImg.layer.cornerRadius = defaultProfileImg.frame.size.width / 2
        defaultProfileImg.layer.masksToBounds = true
        userProfileImg.isHidden = true
        userProfileImg.layer.cornerRadius = userProfileImg.frame.size.width / 2
        userProfileImg.layer.masksToBounds = true
    }
    
    func setupNameView() {
        nameTF.delegate = self
        nameTF.addTarget(self, action: #selector(nameTextfieldDidChange(_:)), for: .editingChanged)
        setupNameTF()
        UserDefaults.standard.setValue(nameTF.text, forKey: "userName")
    }
    
    func setupNameTF() {
        nameTF.spellCheckingType = .no
        nameCharCountLabel.isHidden = (nameTF.text?.count ?? 0) < 1
        let count = 25 - (nameTF.text?.count ?? 0)
        nameCharCountLabel.text = "\(count)"
        DispatchQueue.main.async {
          if count < 0 {
            self.nameCharCountLabel.textColor = UIColor.red
          } else {
            self.nameCharCountLabel.textColor = UIColor.lightGray
          }
        }
        UserDefaults.standard.setValue(nameTF.text, forKey: "userName")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTF.resignFirstResponder()
        nameCharCountLabel.isHidden = true
        return true
    }
    
    @objc func nameTextfieldDidChange(_ textfield: UITextField) {
        setupNameTF()
    }
}


extension ProfileInfoVc: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
          userProfileImg.image = image
          userProfileImg.isHidden = false
          defaultProfileImg.isHidden = true
          profileView.backgroundColor = .clear
          setProfileImg(image, forKey: "profileImage")
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
