//
//  Converter.swift
//  Bit Converter
//
//  Created by Orlando Vargas on 3/3/20.
//  Copyright © 2020 Orlando Vargas. All rights reserved.
//

import Foundation

class Converter {
    
    // Converts a normal text to Binary: String
    static func convertString(toBinary data: String) -> String {
        let bytes = data.utf8CString
        var binary = ""
        
        for i in 0...data.count-1 {
            var val = bytes[i].magnitude
            var bin = ""
            
            while val > 0 {
                if ( val % 2 == 1) {
                    bin += "1"
                } else {
                    bin += "0"
                }
                val /= 2
            }
            while bin.count < 8 {
                bin += "0"
            }
            bin = String(bin.reversed())
            binary += bin + " "
        }
        return binary
    }

    static func encode(from data: String) -> String {
        let bytes = data.utf8CString
        var binary = ""
        
        if (data.count == 0) {
            return VS_String.ErrorMessages.noData
        }
        
        for i in 0...data.count-1 {
            var val = bytes[i].magnitude
            var bin = ""
            
            while val > 0 {
                if ( val % 2 == 1) {
                    bin += "1"
                } else {
                    bin += "0"
                }
                val /= 2
            }
            while bin.count < 8 {
                bin += "0"
            }
            bin = String(bin.reversed())
            binary += bin + " "
        }
        return binary
    }
    
    
    static func decode(from data: String) -> String {
        var message = ""
        var binaryBuild = ""
        var temp = data
        temp = temp.replacingOccurrences(of: " ", with: "")
        
        if (temp.count % 8 != 0 ) {
            return VS_String.ErrorMessages.lengthError
        }
   
        while(temp.count != 0) {
            for _ in 0...7 {
                binaryBuild.append(String(temp.removeFirst()))
            }
            // build message to send back
            // getChar to append to message string
            message.append(getChar(binary: binaryBuild))
            binaryBuild = ""
        }
        return message
    }
    
    static func getChar(binary: String) -> Character {
        var temp = String(binary.reversed())
        var value = 0.0
        
        for n in 0 ... 7 {
            if(temp.removeFirst() == "1") {
                value = value + pow(2.0, Double(n))
            }
        }
        return Character(UnicodeScalar(Int(value))!)
    }
}
