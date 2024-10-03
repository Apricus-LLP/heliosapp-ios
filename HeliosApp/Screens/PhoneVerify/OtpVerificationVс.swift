//
//  OtpVerificationVс.swift
//  HeliosApp
//
//  Created by Pavel Mac on 02/10/24.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit
import OTPTextField

class OtpVerificationVс: UIViewController {
  
  @IBOutlet weak var callBtn: UIButton!
  @IBOutlet weak var resendsmsBtn: UIButton!
  @IBOutlet weak var timerLabel: UILabel!
  @IBOutlet weak var resendSmsLabel: UILabel!
  @IBOutlet weak var resendSMSview: UIView!
  @IBOutlet weak var otpTextField: OTPTextField!
  @IBOutlet weak var wrongNoLabel: UITextView!
  
  var phoneNo: String = ""
  var timer: Timer?
  let counter: Int = 0
  let isTimerRunning = false
  
  override func viewDidLoad() {
      super.viewDidLoad()
      
      self.navigationItem.setHidesBackButton(true, animated: true)
      setupNavTitle()
      setupWrongNoLabel()
      setupOtpTF()
      setupTimer()
      resendSMSview.addBottomBorderView(color: UIColor.LIGHTGRAY)
      resendsmsBtn.setTitle("", for: .normal)
      callBtn.setTitle("", for: .normal)
  }
  
  @IBAction func resendSmsBtn(_ sender: Any) {
      let alert = UIAlertController(title: "HeliosApp", message: "New sms with code sent", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
        DispatchQueue.main.async {
          self.setupTimer()
        }
      }))
      present(alert, animated: true)
  }
  
  @IBAction func callBtn(_ sender: Any) {
      let phoneNumber = phoneNo
      var phone = phoneNumber.replacingOccurrences(of: " ", with: "")
      let url = URL(string: "tel://\(phone)")
      if UIApplication.shared.canOpenURL(url!) {
        UIApplication.shared.open(url!, options: [:]) { success in
          if success {
            print("HeiosApp Calling successfully")
          } else {
            print("HeiosApp unable to make call")
          }
        }
      } else {
        alertMessage(message: "Invalid phone number")
      }
  }
  
  func setupNavTitle() {
      self.title = "Verify \(phoneNo)"
      let appearence = UINavigationBarAppearance()
      appearence.titleTextAttributes = [.foregroundColor: UIColor.GREEN]
      navigationItem.standardAppearance = appearence
  }
  
  func setupWrongNoLabel() {
      let labelText = "Waiting to automatically detect an SMS sent to \(phoneNo). Wrong Number?"
      let attributedString = NSMutableAttributedString(string: labelText)
      
      let phoneNoRange = (labelText as NSString).range(of: phoneNo)
      attributedString.addAttribute(.foregroundColor, value: UIColor(named: "GREEN") ?? UIColor.green, range: phoneNoRange)
      
      let wrongNoRange = (labelText as NSString).range(of: ". Wrong Number?")
      attributedString.addAttribute(.foregroundColor, value: UIColor.label, range: wrongNoRange)
      attributedString.addAttribute(.link, value: "wrongNumberAction", range: wrongNoRange)
      
      wrongNoLabel.attributedText = attributedString
      wrongNoLabel.textColor = UIColor.LIGHTGRAY
      wrongNoLabel.textAlignment = .center
      wrongNoLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
      wrongNoLabel.isEditable = false
      wrongNoLabel.isScrollEnabled = false
      wrongNoLabel.isSelectable = true
      wrongNoLabel.dataDetectorTypes = []
      wrongNoLabel.delegate = self
  }
  
  func setupOtpTF() {
    otpTF.addBottomBorderTF()
    otpTF.delegate = self
    otpTF.otpDelegate = self
    otpTF.becomeFirstResponder()
  }
  
  func setupTimer() {
    var remainingSeconds = 10
    timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
      if remainingSeconds > 1 {
        remainingSeconds -= 1
        print(remainingSeconds)
        let minutes = remainingSeconds / 60
        let seconds = remainingSeconds % 60
        let timeString = String(format: "%02d:%02d", minutes, seconds)
        print(timeString)
        self.timerLabel.text = timeString
        self.resendSmsLabel.layer.opacity = 0.5
        self.resendsmsBtn.isEnabled = false
      } else {
        self.timerLabel.text = ""
        self.resendSmsLabel.layer.opacity = 1
        self.resendsmsBtn.isEnabled = true
        timer.invalidate()
        //print("timer ends")
      }
    })
  }
}


extension OtpVerificationVc: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        if URL.absoluteString == "wrongNumberAction" {
            let alert = UIAlertController(title: "Wrong Number?", message: "Are you sure you want to change the number ?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "No", style: .destructive, handler: nil))
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
              DispatchQueue.main.async {
                let storyboard = UIStoryboard(name: "Main", bundle: .main)
                if let vc = storyboard.instantiateViewController(withIdentifier: "VerifyPhoneNumberVc") as? VerifyPhoneNumberVC {
                    self.navigationController?.pushViewController(vc, animated: true)
                }
              }
            }))
            present(alert, animated: true)
            return false
        }
        return true
    }
}


extension OtpVerificationVC: OTPTextFieldDelegate, UITextFieldDelegate {
    func otpTextField(_ textField: OTPTextField, didChange otpCode: String) {
        if otpCode.count == 6 {
            if otpCode == "000000" {
                let alert = UIAlertController(title: "HeliosApp", message: "Sms code verified successfully", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                  self.timer?.invalidate()
                  DispatchQueue.main.async {
                      let storyboard = UIStoryboard(name: "Main", bundle: .main)
                      if let vc = storyboard.instantiateViewController(withIdentifier: "ProfileInfoVc") as? ProfileInfoVC {
                        self.navigationController?.pushViewController(vc, animated: true)
                      }
                  }
                }))
                present(alert, animated: true)
            } else {
              alertMessage(message: "Wrong sms code entered. Try again")
              textField.text = ""
            }
        }
    }
}
