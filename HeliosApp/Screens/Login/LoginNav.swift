//
//  LoginNav.swift
//  HeliosApp
//
//  Created by Pavel Mac on 14/09/24.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

class LoginNav: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            
            if (UserDefaults.standard.value(forKey: "userName") != nil) {
                
                let storyboard = UIStoryboard(name: "TabBarVc", bundle: nil)
                if let vc = storyboard.instantiateViewController(withIdentifier: "TabBarVc") as? TabBarController {
                    vc.modalPresentationStyle = .fullScreen
                    vc.modalTransitionStyle = .crossDissolve
                    self.present(vc, animated: true, completion: nil)
                }
                
            } else {
                
                let storyboard = UIStoryboard(name: "Login", bundle: .main)
                if let vc = storyboard.instantiateViewController(withIdentifier: "TermsAndServicesVc") as? TermsAndServicesVс {
                    self.navigationController?.pushViewController(vc, animated: false)
                }
            }
        }
    }
}
