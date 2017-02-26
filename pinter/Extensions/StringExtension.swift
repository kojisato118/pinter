//
//  StringExtension.swift
//  pinter
//
//  Created by 佐藤 康次 on 2017/02/26.
//  Copyright © 2017年 toosaa. All rights reserved.
//

import UIKit

extension String {
    static func random(with length: Int) -> String {
        
        let alphabet = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let upperBound = UInt32(alphabet.characters.count)
        
        return String((0..<length).map { _ -> Character in
            return alphabet[alphabet.index(alphabet.startIndex, offsetBy: Int(arc4random_uniform(upperBound)))]
        })
    }
}
