//
//  PasswordResetController.swift
//  iInspection
//
//  Created by Cohen Plontke on 2019-06-23.
//  Copyright © 2019 Cohen Plontke. All rights reserved.
//

import UIKit
import Firebase

class PasswordResetController: UIViewController {
    
    let forgotYourLabel: UILabel = {
        let label = UILabel()
        label.text = "Forgot Your Password?"
        label.textColor = .white
        label.numberOfLines = 2
        label.font = UIFont(name: label.font.fontName, size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   
    
    let explanationLabel: UILabel = {
        let label = UILabel()
        label.text = "Please enter your email"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: label.font.fontName, size: 15 )
        return label
    }()
    
    let inputContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = false
        
        return view
    }()
    
    let textField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email"
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 1)
        button.setTitle("Cancel" , for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(returnToLogin), for: .touchUpInside)
        return button
    }()
    
    let confirmButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 1)
        button.setTitle("Send Email" , for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(sendEmail), for: .touchUpInside)
        return button
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 61/255, green: 91/255, blue: 151/255, alpha: 1)
        
        view.addSubview(forgotYourLabel)
        view.addSubview(explanationLabel)
        view.addSubview(inputContainerView)
        view.addSubview(backButton)
        view.addSubview(confirmButton)
        
        setupForgotYourLabel()
        
        setupExplanationLabel()
        setupInputContainer()
        setupBackButton()
        setupConfirmButton()
        
    }
    
    
    func setupForgotYourLabel() {
        forgotYourLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        forgotYourLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -175).isActive = true
        
        forgotYourLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        forgotYourLabel.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
    }
    
   
    
    func setupExplanationLabel() {
        
        explanationLabel.topAnchor.constraint(equalTo: forgotYourLabel.bottomAnchor, constant: 12).isActive = true
        
        explanationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        explanationLabel.widthAnchor.constraint(equalTo: forgotYourLabel.widthAnchor).isActive = true
        
        explanationLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func setupInputContainer() {
        inputContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        inputContainerView.topAnchor.constraint(equalTo: explanationLabel.bottomAnchor, constant: 20).isActive = true
        
        inputContainerView.widthAnchor.constraint(equalTo: explanationLabel.widthAnchor, constant: 25).isActive = true
        
        inputContainerView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        inputContainerView.addSubview(textField)
        
        textField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor).isActive = true
        
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textField.topAnchor.constraint(equalTo: inputContainerView.topAnchor).isActive = true
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupBackButton() {
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        
        backButton.topAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: 50).isActive = true
        
        backButton.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor, multiplier: 1/2).isActive = true
        
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupConfirmButton() {
        confirmButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        
        confirmButton.topAnchor.constraint(equalTo: inputContainerView.bottomAnchor, constant: 50).isActive = true
        
        confirmButton.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor, multiplier: 1/2).isActive = true
        
        confirmButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    @objc func returnToLogin() {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    @objc func sendEmail() {
        guard let email = textField.text else {
            return
        }
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if error != nil {
                print(error.debugDescription)
            }else {
                self.explanationLabel.text = "Email sent"
                self.confirmButton.isHidden = true
                self.explanationLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
                
            }
            
        }
    }
}
