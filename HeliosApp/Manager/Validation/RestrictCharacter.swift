//
//  RestrictCharacter.swift
//  HeliosApp
//
//  Created by Pavel Mac on 30/09/24.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import Foundation

final class RestrictCharacter {
    func onlyAlphabet(string: String)->Bool{
        let characterSet = CharacterSet(charactersIn: string)
        let allowedCharacters = CharacterSet(charactersIn:"abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    func onlyAlphabetWithoutSpace(string: String)->Bool{
        let characterSet = CharacterSet(charactersIn: string)
        let allowedCharacters = CharacterSet(charactersIn:"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ '")
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    func onlyNumber(string: String,maxNumber: Int, txtString: String, range: NSRange)->Bool{
        let characterSet = CharacterSet(charactersIn: string)
        let currentString = txtString as NSString
        let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString
        let maxCharacter = newString.length <= maxNumber //Max length
        let allowedCharacters = CharacterSet.decimalDigits
        return allowedCharacters.isSuperset(of: characterSet) && maxCharacter
    }
}
