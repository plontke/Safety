//
//  LoginController.swift
//  iInspection
//  The controller for the login register screen
//  Created by Cohen Plontke on 2019-06-21.
//  Copyright © 2019 Cohen Plontke. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginController: UIViewController {
    
    
    //Creates the White Container seen on the login screen
    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = false
        
        return view
    }()
    
    // Creates the Register button in the Login Screen
    lazy var loginRegisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 1)
        button.setTitle("Login" , for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleLoginRegister), for: .touchUpInside)
        return button
    }()
    
    
   
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    let nameSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    let emailSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var loginRegisterSegmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Login", "Register"])
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.tintColor = .white
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(handleControlChange), for: .valueChanged)
        return sc
    }()
    
     // Need to have a reference of the height to take out when logged in is selected
    var inputsContainerViewHeightAnchor: NSLayoutConstraint?
    var nameTextViewHeightAnchor: NSLayoutConstraint?
    var emailTextViewHeightAnchor: NSLayoutConstraint?
    var passwordTextViewHeightAnchor: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 61/255, green: 91/255, blue: 151/255, alpha: 1)
        self.navigationController?.navigationBar.barStyle = .black

        view.addSubview(inputsContainerView)
        view.addSubview(loginRegisterButton)
        view.addSubview(loginRegisterSegmentedControl)
        
        
        setupInputsContainer()
        setupLoginRegisterButton()
        setupLoginRegisterControl()
        
        
    }

    
    
    // THis is the setup for the white container background seen on the login screen
    func setupInputsContainer() {
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputsContainerViewHeightAnchor =
    inputsContainerView.heightAnchor.constraint(equalToConstant: 100)
        inputsContainerViewHeightAnchor?.isActive = true
        inputsContainerView.addSubview(nameTextField)
        inputsContainerView.addSubview(nameSeparatorView)
        inputsContainerView.addSubview(emailTextField)
        inputsContainerView.addSubview(emailSeparatorView)
        inputsContainerView.addSubview(passwordTextField)
        
        setupNameTextView()
        setupNameSeparatorView()
        setupEmailTextView()
        setupEmailSeparatorView()
        setupPasswordTextView()
        
    }
    
    // TODO Insert an image of logo of app on top of the selector of the login screen
    
    
    // name input space
    func setupNameTextView() {
        nameTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        
        nameTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        
        nameTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        
        nameTextViewHeightAnchor =
    nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 0)
        nameTextViewHeightAnchor?.isActive = true
    }
    // The line between name & email
    func setupNameSeparatorView() {
        nameSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        
        nameSeparatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        
        nameSeparatorView.widthAnchor.constraint(equalTo: nameTextField.widthAnchor).isActive = true
        
        nameSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
    
    // The input of the email
    func setupEmailTextView() {
        
        emailTextField.leftAnchor.constraint(equalTo: nameTextField.leftAnchor).isActive = true
        
        emailTextField.topAnchor.constraint(equalTo: nameSeparatorView.bottomAnchor).isActive = true
        
        emailTextField.widthAnchor.constraint(equalTo: nameTextField.widthAnchor).isActive = true
        emailTextViewHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/2)
        emailTextViewHeightAnchor?.isActive = true
    }
    
    // Sets up the line between them
    func setupEmailSeparatorView() {
        emailSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        
        emailSeparatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        
        emailSeparatorView.widthAnchor.constraint(equalTo: emailTextField.widthAnchor).isActive = true
        
        emailSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
    // Sets up the text
    func setupPasswordTextView() {
        
        passwordTextField.leftAnchor.constraint(equalTo: nameTextField.leftAnchor).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: emailSeparatorView.bottomAnchor).isActive = true
        
        passwordTextField.widthAnchor.constraint(equalTo: nameTextField.widthAnchor).isActive = true
        
        passwordTextViewHeightAnchor = passwordTextField.heightAnchor.constraint(greaterThanOrEqualTo: inputsContainerView.heightAnchor, multiplier: 1/2)
        passwordTextViewHeightAnchor?.isActive = true
        
    }

    // This sets up the login and register button
    func setupLoginRegisterButton() {
        loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        loginRegisterButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 12).isActive = true
        
        loginRegisterButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        

        
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupLoginRegisterControl() {
        loginRegisterSegmentedControl.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        
        loginRegisterSegmentedControl.bottomAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: -12).isActive = true
        
        loginRegisterSegmentedControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        loginRegisterSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    
    @objc func handleLoginRegister() {
        if loginRegisterSegmentedControl.selectedSegmentIndex == 0 {
            handleLogin()
        }else {
            handleRegister()
        }
    }

    
    func handleLogin() {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            print("Incorrect Information")
            return
        }
        Auth.auth().signIn(withEmail: email, password: password, completion: {(user, error) in
            if error != nil {
                print(error)
                return
            }
            self.presentingViewController?.dismiss(animated: true, completion: nil)
        })
    }
    
    // When the register button is hit
    func handleRegister() {
    
        guard let email = emailTextField.text, let password = passwordTextField.text, let name = nameTextField.text else {
            print("Incorrect Information")
            return
        }
        
        // Create the user
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let _eror = error {
                print(_eror.localizedDescription)
                return
            }else{
                // Log the User in
                print(result?.additionalUserInfo)
                Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                    if error != nil {
                        print(error.debugDescription)
                    } else {
                        // User created in Authentication, must put them into the DB now
                        print("User Signed in")
                        let db = Firestore.firestore()
                        var ref: DocumentReference? = nil
                        ref = db.collection("users").addDocument(data: [
                            "name" : name,
                            "uid" : Auth.auth().currentUser!.uid,
                            "email" : email])
                        // GOTO the Original screen
                        self.presentingViewController?.dismiss(animated: true, completion: nil)
                        
                        }
                    }
                    
                    
                }
            }
        
    }
    
    
    // This is called when the login or register control is changed, and makes the appropriate changes to the UI
    @objc func handleControlChange() {
        let title = loginRegisterSegmentedControl.titleForSegment(at: loginRegisterSegmentedControl.selectedSegmentIndex)
        loginRegisterButton.setTitle(title, for: .normal)
        
        
        inputsContainerViewHeightAnchor?.constant = loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 100 : 150
        
        
        
        nameTextViewHeightAnchor?.isActive = false
        nameTextViewHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 0 : 1/3)
        nameTextViewHeightAnchor?.isActive = true
        
        passwordTextViewHeightAnchor?.isActive = false
        passwordTextViewHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/3)
        passwordTextViewHeightAnchor?.isActive = true
        
        
        emailTextViewHeightAnchor?.isActive = false
        emailTextViewHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/3)
        emailTextViewHeightAnchor?.isActive = true
        
    }

    
}
