//
//  VerifyPhoneNumberVс.swift
//  HeliosApp
//
//  Created by Pavel Mac on 02/10/24.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit
//import CountryPickerView
//import FlagPhoneNumber

protocol getPhoneNumberDelegate: AnyObject {
    func getPhoneNumber(phoneNumber: String)
}

class VerifyPhoneNumberVс: UIViewController {
    
    @IBOutlet weak var phoneNumberView: FPNTextField!
    @IBOutlet weak var countriesPicker: CountryPickerView!
    
    weak var delegate: getPhoneNumberDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        setupCountryPickerView()
        setupPhoneNo()
        countriesPicker.setCountryByCode("KZ")
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.BLACKWHITE
            appearance.titleTextAttributes = [.foregroundColor: UIColor.label]
            self.navigationController?.navigationBar.standardAppearance = appearance
            self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
    }
    
    @IBAction func verifyBtn(_ sender: Any) {
        guard let phoneNumber = phoneNumberView.text, !phoneNumber.isEmpty else {
            alertMessage(message: "Phone number can not be Empty!")
            return
        }
        
        let countryCode = phoneNumberView.selectedCountry?.phoneCode ?? ""
        let fullPhoneNumber = "\(countryCode) \(phoneNumber)"
        UserDefaults.standard.setValue(fullPhoneNumber, forKey: "phoneNo")
        
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        if let vc = storyboard.instantiateViewController(withIdentifier: "OtpVerificationVc") as? OtpVerificationVC {
          vc.phoneNo = fullPhoneNumber
          self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func setupCountryPickerView() {
        countriesPicker.setCountryByCode("KZ")
        countriesPicker.showCountryNameInView = true
        countriesPicker.showPhoneCodeInView = false
        countriesPicker.textColor = UIColor.label
        countriesPicker.countryDetailsLabel.textAlignment = .center
        countriesPicker.addBottomBorderView(color: UIColor.systemOrange)
        countriesPicker.delegate = self
    }
    
    func setupPhoneNo() {
        phoneNumberView.setFlag(key: .KZ)
        phoneNumberView.textColor = .label
        phoneNumberView.addBottomBorderTF()
        phoneNumberView.placeholder = "Enter you phone number"
        phoneNumberView.becomeFirstResponder()
    }
}


extension VerifyPhoneNumberVc: CountryPickerViewDelegate {
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
        if let countryCode = FPNCountryCode(rawValue: country.code) {
            phoneNumberView.setFlag(countryCode: countryCode)
        }
        phoneNumberView.set(phoneNumber: country.phoneCode)
    }
}
