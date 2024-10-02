//
//  Validation.swift
//  HeliosApp
//
//  Created by Pavel Mac on 23/09/24.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import Foundation

struct ValidationResult {
    let success: Bool
    let error : String
}

final class ValidationManager {
   
    func name(_ value:String?) -> ValidationResult {
        let name = (value ?? "").trimmingCharacters(in: .whitespaces)
         if name.isEmpty{
             return .init(success: false, error: "Name cannot be empty")
         }
        let set = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ")
        if(name.rangeOfCharacter(from: set.inverted) != nil ) {
            return .init(success: false, error: "In name text field Special character, number not valid")
        }
        return .init(success: true, error: "")
      
    }
    
     func phoneNumber(_ value : String?) -> ValidationResult {
        let mobile = (value ?? "").trimmingCharacters(in: .whitespaces)
        if mobile.isEmpty {
            return .init(success: false, error: "Phone number cannot be empty")
        }
        else if mobile.count != 10{
            return .init(success: false, error: "Phone number should be of 10 digit")
        }
        else {
            let phoneRegex = "^[6-9]\\d{9}$"
            let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            if phoneTest.evaluate(with: mobile) {
                return .init(success: true, error: "")
            }
            else {
                return .init(success: false, error: "Please enter valid Phone number")
            }
        }
    }
    
     func email(_ value:String?) -> ValidationResult {
        let email = (value ?? "").trimmingCharacters(in: .whitespaces)
        if email.isEmpty {
            return .init(success: false, error: "Email cannot be empty")
        } else {
            // let reqularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let reqularExpression = "[A-Z0-9a-z._]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
            if !predicate.evaluate(with: email) {
                return .init(success: false, error: "Email should be valid")
            }
            else {
                return .init(success: true, error: "")
            }
        }
    }
    
    func intake(_ value:String?, header: String) -> (error: String, isSuccess: Bool) {
        if value!.isEmpty { return ("Please enter \(header)", false) }
        if let value {
            guard let num = Int(value) else {return ("Please enter valid \(header)", false)}
            if num <= 0{
                return ("Please enter valid \(header)", false)
            }
        }
        return ("", true)
    }
}
