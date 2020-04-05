//
//  Encodable.swift
//  Bit Converter
//
//  Created by Orlando Vargas on 3/23/20.
//  Copyright © 2020 Orlando Vargas. All rights reserved.
//

import Foundation

protocol Encodable {
    static func convert(toRaw data: String) -> Int
    static func convertString(toBinary data: String) -> String
    static func convertBinary(toString data: String) -> String
}
