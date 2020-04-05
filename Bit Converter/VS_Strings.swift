//
//  VS_Strings.swift
//  Bit Converter
//
//  Created by Orlando Vargas on 3/28/20.
//  Copyright © 2020 Orlando Vargas. All rights reserved.
//

import Foundation

struct VS_String {
    static let title = "Bit Converter"
    static let desc = "Text -> Binary"
    
    struct Generic {
        static let enterText = "Enter Text Here"
    }
    
    struct ButtonTitle {
        static let decode = "Decode"
        static let encode = "Encode"
        static let copy = "Copy"
        static let ok = "Ok"
        static let cancel = "Cancel"
    }
    
    struct ErrorMessages {
        static let lengthError = "Error: Byte not proper length."
        static let genericError = "Error: Something went wrong."
        static let noData = "There's no text to convert!"
        static let failRequest = "Unable to complete request"
    }
}
