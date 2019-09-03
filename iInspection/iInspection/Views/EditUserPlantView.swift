//
//  EditUserPlant.swift
//  iInspection
//
//  Created by Cohen Plontke on 2019-08-11.
//  Copyright © 2019 Cohen Plontke. All rights reserved.
//

import UIKit

class EditUserPlantView: UIView {
    
    
    // Count select is used to attach the listener to the tableView
    var registerIsShown: Bool = false
    var tableViewIsShown: Bool = false
    var countSelect: Int = 0
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "User is not registered to a plant.\nPlease select which applies to you"
        label.numberOfLines = 2
        label.textColor = .white
        label.frame.size.width = 50
        label.font = UIFont(name: label.font.fontName, size: 20)
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
   public static var plantTableView : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    //Creates the White Container
    let inputsContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = false
        
        return view
    }()
    
    public static var plantNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Plant Name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    public static var companyTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Company Name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Plant Registration"
        label.textColor = .white
        label.font = UIFont(name: label.font.fontName, size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register New Plant", for: .normal)
        button.backgroundColor = UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(registerWasPressed), for: .touchUpInside)
        return button
    }()
    
    
    public var secondRegisterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register Plant", for: .normal)
        button.backgroundColor = UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(EditUserPlant(), action: #selector(EditUserPlant.handleSecondRegisterPressed), for: .touchUpInside)
        return button
    }()
    
    public var selectButton: UIButton = {
        let button = UIButton()
        button.setTitle("Request to Join Existing Plant", for: .normal)
        button.backgroundColor = UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 1)
        button.addTarget(self, action: #selector(selectWasPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.backgroundColor = UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 1)
        button.addTarget(self, action: #selector(registerWasPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let companySeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public var selectBackButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.backgroundColor = UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 1)
        button.addTarget(self, action: #selector(selectWasPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let cancelRequestButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel Request", for: .normal)
        button.backgroundColor = UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 1)
        button.addTarget(EditUserPlant(), action: #selector(EditUserPlant.cancelRequest), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public var secondSelectButton : UIButton = {
        let button = UIButton()
        button.setTitle("Select Plant", for: .normal)
        button.backgroundColor = UIColor(red: 80/255, green: 101/255, blue: 161/255, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(EditUserPlant(), action: #selector(EditUserPlant.handleSecondSelectPressed), for: .touchUpInside)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 61/255, green: 91/255, blue: 151/255, alpha: 1)
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(registerButton)
        self.addSubview(selectButton)
        self.addSubview(inputsContainer)
        self.addSubview(secondRegisterButton)
        self.addSubview(backButton)
        self.addSubview(EditUserPlantView.plantTableView)
        self.addSubview(selectBackButton)
        self.addSubview(secondSelectButton)
        self.addSubview(cancelRequestButton)
        inputsContainer.addSubview(companySeparatorView)
        addObservers()
        setupSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // listens for the users inputs
    func addObservers() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(requestWasSent), name: NSNotification.Name("requestSent"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(requestWasCancelled), name: NSNotification.Name("requestHasBeenCancelled"), object: nil)
    }
    
    // setup all of the subviews
    func setupSubViews() {
        setupTitleLabel()
        setupDescriptionLabel()
        setupRegisterButton()
        setupSelectButton()
        setupInputsContainer()
        setupBackButton()
        setupSecondRegisterButton()
        setupTableView()
        setupBackButtonSelect()
        setupSecondSelectButton()
        setupCancelButton()
    }
    
    func  setupTitleLabel() {
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 100).isActive = true
    }
    
    func setupDescriptionLabel() {
        descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: 100).isActive = true
    }
    
    func setupRegisterButton() {
        registerButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        registerButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        registerButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 15).isActive = true
        registerButton.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: 100).isActive = true
    }
    
    func setupInputsContainer() {
        inputsContainer.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        inputsContainer.centerYAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 75).isActive = true
        inputsContainer.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -24).isActive = true
        inputsContainer.heightAnchor.constraint(equalToConstant: 70).isActive = true
        inputsContainer.isHidden = true
        inputsContainer.addSubview(EditUserPlantView.plantNameTextField)
        inputsContainer.addSubview(EditUserPlantView.companyTextField)
        setupSeperatorView()
        setupPlantNickNameTextField()
        setupCompanyTextField()
    }
    
    func setupSecondSelectButton() {
        secondSelectButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        secondSelectButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        secondSelectButton.topAnchor.constraint(equalTo: selectBackButton.bottomAnchor, constant: 15).isActive = true
        secondSelectButton.bottomAnchor.constraint(equalTo: secondSelectButton.topAnchor, constant: 50).isActive = true
        secondSelectButton.isHidden = true
    }
    
    func setupSelectButton() {
        selectButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        selectButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        selectButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 15).isActive = true
        selectButton.bottomAnchor.constraint(equalTo: selectButton.topAnchor, constant: 100).isActive = true
    }
    
    func setupBackButton() {
        backButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        backButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        backButton.topAnchor.constraint(equalTo: inputsContainer.bottomAnchor, constant: 15).isActive = true
        backButton.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: 50).isActive = true
        backButton.isHidden = true
    }
    
    func setupBackButtonSelect() {
        selectBackButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        selectBackButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        selectBackButton.topAnchor.constraint(equalTo: EditUserPlantView.plantTableView.bottomAnchor, constant: 15).isActive = true
        selectBackButton.bottomAnchor.constraint(equalTo: selectBackButton.topAnchor, constant: 50).isActive = true
        selectBackButton.isHidden = true
    
    }
    
    
    
    func setupSecondRegisterButton() {
        secondRegisterButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        secondRegisterButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        secondRegisterButton.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 15).isActive = true
        secondRegisterButton.bottomAnchor.constraint(equalTo: secondRegisterButton.topAnchor, constant: 50).isActive = true
        secondRegisterButton.isHidden = true
    }
    
    
    func setupSeperatorView(){
        companySeparatorView.leftAnchor.constraint(equalTo: inputsContainer.leftAnchor).isActive = true
        companySeparatorView.rightAnchor.constraint(equalTo: inputsContainer.rightAnchor).isActive = true
        companySeparatorView.topAnchor.constraint(equalTo: inputsContainer.topAnchor, constant: 34).isActive = true
        companySeparatorView.bottomAnchor.constraint(equalTo: companySeparatorView.topAnchor, constant: 1).isActive = true
    }
    
    func setupPlantNickNameTextField() {
        EditUserPlantView.plantNameTextField.leftAnchor.constraint(equalTo: inputsContainer.leftAnchor, constant: 3).isActive = true
        EditUserPlantView.plantNameTextField.rightAnchor.constraint(equalTo: inputsContainer.rightAnchor).isActive = true
        EditUserPlantView.plantNameTextField.topAnchor.constraint(equalTo: inputsContainer.topAnchor).isActive = true
        EditUserPlantView.plantNameTextField.bottomAnchor.constraint(equalTo: companySeparatorView.topAnchor).isActive = true
    }
    
    
    func setupCompanyTextField() {
        EditUserPlantView.companyTextField.leftAnchor.constraint(equalTo: inputsContainer.leftAnchor, constant: 3).isActive = true
        EditUserPlantView.companyTextField.rightAnchor.constraint(equalTo: inputsContainer.rightAnchor).isActive = true
        EditUserPlantView.companyTextField.topAnchor.constraint(equalTo: companySeparatorView.bottomAnchor, constant: 5).isActive = true
        EditUserPlantView.plantNameTextField.bottomAnchor.constraint(equalTo: inputsContainer.bottomAnchor).isActive = true
    }

    
    func setupTableView() {
        EditUserPlantView.plantTableView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        EditUserPlantView.plantTableView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -24).isActive = true
        EditUserPlantView.plantTableView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 25).isActive = true
        EditUserPlantView.plantTableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12).isActive = true
        EditUserPlantView.plantTableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        EditUserPlantView.plantTableView.isHidden = true
    }
    
    
    func setupCancelButton() {
        cancelRequestButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        cancelRequestButton.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -24).isActive = true
        cancelRequestButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 25).isActive = true
        cancelRequestButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12).isActive = true
        cancelRequestButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        cancelRequestButton.isHidden = true
    }
    
    
    
    // the register button was pressed adjust the view
    @objc
    func registerWasPressed() {
        if !registerIsShown {
            print("Setup input container view")
            registerButton.isHidden = true
            backButton.isHidden = false
            selectButton.isHidden = true
            inputsContainer.isHidden = false
            secondRegisterButton.isHidden = false
            registerIsShown = true
            descriptionLabel.text = "Enter the plants name and company"
        } else {
            print("registerIsShown == true")
            descriptionLabel.text = "User is not registered to a plant.\nPlease select which applies to you"
            inputsContainer.isHidden = true
            registerButton.isHidden = false
            selectButton.isHidden = false
            backButton.isHidden = true
            secondRegisterButton.isHidden = true
            registerIsShown = false
        }
        
    }
    
    
    //select was pressed adjust the view accordingly
    @objc
    func selectWasPressed() {
        if self.countSelect == 0 {
            NotificationCenter.default.post(name: NSNotification.Name("attachPlantListener"), object: nil)
            self.countSelect += 1
        }
        if !tableViewIsShown {
            EditUserPlantView.plantTableView.isHidden = false
            registerButton.isHidden = true
            descriptionLabel.text = "Please Select Your Plant"
            selectButton.isHidden = true
            selectBackButton.isHidden = false
            tableViewIsShown = true
            secondSelectButton.isHidden = false

        } else {
            EditUserPlantView.plantTableView.isHidden = true
            registerButton.isHidden = false
            descriptionLabel.text = "User is not registered to a plant.\nPlease select which applies to you"
            selectButton.isHidden = false
            selectBackButton.isHidden = true
            secondSelectButton.isHidden = true
            tableViewIsShown = false
        }
    }
    
    
    // Once requested the user cannot do anything else
    @objc
    func requestWasSent() {
        selectBackButton.isHidden = true
        secondSelectButton.isHidden = true
        registerButton.isHidden = true
        selectButton.isHidden = true
        tableViewIsShown = false
        EditUserPlantView.plantTableView.isHidden = true
        titleLabel.text = "Request Sent"
        descriptionLabel.text = "Please notify your lead\nto accept your request"
        cancelRequestButton.isHidden = false
    }

    //The User has cancelled their request revert the screen
    @objc
    func requestWasCancelled() {
        print("request has been cancelled")
        titleLabel.text = "Plant Registration"
        descriptionLabel.text = "User is not registered to a plant.\nPlease select which applies to you"
        selectButton.isHidden = false
        registerButton.isHidden = false
        cancelRequestButton.isHidden = true
    }
    
}
