//
//  ViewController.swift
//  Bit Converter
//
//  Created by Orlando Vargas on 3/2/20.
//  Copyright © 2020 Orlando Vargas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myTitle = VSTitleLabel(textAlignment: .center, fontSize: 40)
    var conversionLabel = VSTitleLabel(textAlignment: .center, fontSize: 20)
    var stringView = UITextView(frame: .zero)
    var bytesView = UITextView(frame: .zero)
    var encodeButton = VSButton(backgroundColor: .red, title: VS_String.ButtonTitle.encode)
    var decodeButton = VSButton(backgroundColor: .red, title: VS_String.ButtonTitle.decode)
    var copyButton = VSButton(backgroundColor: .red, title: VS_String.ButtonTitle.copy)
    
    var binaryOfString: String?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        configureTitle()
        configureStringView()
        configureConversionLable()
        configureBytesView()
        configureCopyButton()
        configureEncodeButton()
        configureDecodeButton()
        createDismissKeyboardTapGesture()
    }
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    func configureTitle() {
        view.addSubview(myTitle)
        myTitle.translatesAutoresizingMaskIntoConstraints = false
        myTitle.text = VS_String.title
        myTitle.textColor = .white
        
        NSLayoutConstraint.activate([
            myTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myTitle.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func configureStringView() {
        view.addSubview(stringView)
        
        stringView.translatesAutoresizingMaskIntoConstraints = false
        stringView.backgroundColor = .systemGray6
        stringView.layer.cornerRadius = 16
        stringView.font = .systemFont(ofSize: 18)
        stringView.accessibilityHint = VS_String.Generic.enterText
        
        NSLayoutConstraint.activate([
            stringView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            stringView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stringView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stringView.heightAnchor.constraint(equalToConstant: 256)
        ])
    }
    
    func configureConversionLable() {
        view.addSubview(conversionLabel)

        conversionLabel.translatesAutoresizingMaskIntoConstraints = false
        conversionLabel.text = VS_String.desc
        conversionLabel.textColor = .white
        NSLayoutConstraint.activate([
            conversionLabel.topAnchor.constraint(equalTo: stringView.bottomAnchor),
            conversionLabel.heightAnchor.constraint(equalToConstant: 40),
            conversionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            conversionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func configureBytesView() {
        view.addSubview(bytesView)
        bytesView.translatesAutoresizingMaskIntoConstraints = false
        bytesView.backgroundColor = .systemGray6
        bytesView.layer.cornerRadius = 16
        bytesView.font = .systemFont(ofSize: 18)
        
        NSLayoutConstraint.activate([
            bytesView.topAnchor.constraint(equalTo: conversionLabel.bottomAnchor, constant: 16),
            bytesView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bytesView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            bytesView.heightAnchor.constraint(equalToConstant: 256)
        ])
    }
    
    func configureEncodeButton() {
        view.addSubview(encodeButton)
        encodeButton.layer.cornerRadius = 16
        encodeButton.translatesAutoresizingMaskIntoConstraints = false
        encodeButton.addTarget(self, action: #selector (getData), for: .touchUpInside)
        
        let fullWidth = view.frame.width
        let usableWidth = fullWidth - 32
        
        NSLayoutConstraint.activate([
            encodeButton.heightAnchor.constraint(equalToConstant: 64),
            encodeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            encodeButton.widthAnchor.constraint(equalToConstant: usableWidth/2 - 8),
            encodeButton.bottomAnchor.constraint(equalTo: copyButton.topAnchor, constant: -16)
        ])
    }
    
    func configureDecodeButton() {
        view.addSubview(decodeButton)
        decodeButton.layer.cornerRadius = 16
        decodeButton.translatesAutoresizingMaskIntoConstraints = false
        decodeButton.addTarget(self, action: #selector(decode), for: .touchUpInside)
        
        let fullwidth = view.frame.width
        let usableWidth = fullwidth - 32
        
        NSLayoutConstraint.activate([
            decodeButton.bottomAnchor.constraint(equalTo: copyButton.topAnchor, constant: -16),
            decodeButton.widthAnchor.constraint(equalToConstant: usableWidth/2 - 8),
            decodeButton.trailingAnchor.constraint(equalTo:view.trailingAnchor, constant: -16),
            decodeButton.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
    
    @objc func getData() {
        let stringToBeEncoded = stringView.text!
        
        binaryOfString = Converter.encode(from: stringToBeEncoded)
        
        bytesView.text = binaryOfString
    }
    
    @objc func decode() {
        let stringToBeDecoded = bytesView.text!
    
        stringView.text = Converter.decode(from: stringToBeDecoded)
    }
    
    @objc func copyToClip() {
        UIPasteboard.general.string = binaryOfString
    }
    
    func configureCopyButton() {
        view.addSubview(copyButton)
        copyButton.layer.cornerRadius = 16
        copyButton.translatesAutoresizingMaskIntoConstraints = false
        copyButton.addTarget(self, action: #selector(copyToClip), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            copyButton.heightAnchor.constraint(equalToConstant: 64),
            copyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            copyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            copyButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

