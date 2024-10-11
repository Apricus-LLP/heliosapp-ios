//
//  TermsAndServicesVс.swift
//  HeliosApp
//
//  Created by Pavel Mac on 02/10/24.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit
import SafariServices
//import Lottie

class TermsAndServicesVс: UIViewController {
  
  //@IBOutlet weak var animationView: LottieAnimationView!
  @IBOutlet weak var policyServicesLabel: UITextView!
  
  override func viewDidLoad() {
      super.viewDidLoad()
      
      self.navigationItem.setHidesBackButton(true, animated: true)
      navigationController?.navigationBar.prefersLargeTitles = false
      setupPrivacyLabel()
      setupAgreeContinueAnimationView()
  }
  
  @IBAction func agreeBtn(_ sender: Any) {
      let storyboard = UIStoryboard(name: "Main", bundle: .main)
      if let verifyVc = storyboard.instantiateViewController(withIdentifier: "VerifyPhoneNumberVc") as? VerifyPhoneNumberVс {
          self.navigationController?.pushViewController(verifyVc, animated: true)
      }
  }
  
  func setupPrivacyLabel() {
      let labelText = "Read our Privacy Policy. Tap \"Agree and Continue\" to accept the Terms of Services."
      let attributedString = NSMutableAttributedString(string: labelText)
      
      let privacyPolicyRange = (labelText as NSString).range(of: "Privacy Policy")
      let termsOfServicesRange = (labelText as NSString).range(of: "Terms of Services")
      
      attributedString.addAttribute(.link, value: "https://apricus.kz/privacy-policy", range: privacyPolicyRange)
      attributedString.addAttribute(.link, value: "https://apricus.kz/terms-of-service", range: termsOfServicesRange)
      
      policyServicesLabel.attributedText = attributedString
      policyServicesLabel.isEditable = false
      policyServicesLabel.isScrollEnabled = false
      policyServicesLabel.textColor = UIColor(named: "LIGHTGRAY")
      policyServicesLabel.textAlignment = .center
      policyServicesLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
      policyServicesLabel.dataDetectorTypes = []
      policyServicesLabel.delegate = self
  }
  
    func setupAgreeContinueAnimationView() {
//        animationView.contentMode = .scaleAspectFit
//        animationView.loopMode = .loop
//        animationView.animationSpeed = 0.4
//        animationView.play()
    }
}


extension TermsAndServicesVс: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        let safariVc = SFSafariViewController(url: URL)
        safariVc.modalPresentationStyle = .overFullScreen
        present(safariVc, animated: true, completion: nil)
        return false
    }
}
