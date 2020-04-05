//
//  VSTitleLabel.swift
//  Bit Converter
//
//  Created by Orlando Vargas on 3/2/20.
//  Copyright © 2020 Orlando Vargas. All rights reserved.
//

import UIKit

class VSTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
    }
    
}
