//
//  Cell+Extension.swift
//  HeliosApp
//
//  Created by Pavel Mac on 28/09/24.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit

protocol IdNibLoadable {
    static var id: String { get }
    static var nib: UINib { get }
}

extension IdNibLoadable {
    static var id: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: id, bundle: nil)
    }
}


extension UIViewController: IdNibLoadable {
    //
}


extension UIView: IdNibLoadable {
    //
}
