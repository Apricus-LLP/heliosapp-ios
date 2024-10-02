//
//  EditContactVc.swift
//  HeliosApp
//
//  Created by Pavel Mac on 15/09/24.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

class EditContactVc: UIViewController {

    @IBOutlet weak var saveBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didCancelBtnClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didSaveBtnClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
