//
//  ViewController.swift
//  ui-program
//
//  Created by Soultan Muhammad Albar on 28/05/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    lazy var signUpLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 130/255, green: 131/255, blue: 134/255, alpha: 1)
        label.font = .systemFont(ofSize: 52, weight: .regular)
        label.text = "Sign Up"
        
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 130/255, green: 131/255, blue: 134/255, alpha: 1)
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.text = "Email"
        
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.textContentType = .emailAddress
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.placeholder = "Masukkan email"
        
        return textField
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 130/255, green: 131/255, blue: 134/255, alpha: 1)
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.text = "Password"
        
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.textContentType = .emailAddress
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.placeholder = "Masukkan password"
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    lazy var submitButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Masuk", for: .normal)
        btn.setTitleColor(UIColor(red: 130/255, green: 131/255, blue: 134/255, alpha: 1), for: .normal)
        btn.backgroundColor = .white
        btn.layer.borderWidth = 1
        btn.layer.borderColor = CGColor(red: 130/255, green: 131/255, blue: 134/255, alpha: 1)
        btn.layer.cornerRadius = 10
        
        return btn
    }()
    
    lazy var emailStackView: UIStackView = {
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField])
        emailStackView.translatesAutoresizingMaskIntoConstraints = false
        emailStackView.axis = .vertical
        emailStackView.distribution = .equalCentering
        emailStackView.spacing = 4
        
        return emailStackView
    }()
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
        view.addSubview(signUpLabel)
        view.addSubview(emailStackView)
        
        signUpLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
        signUpLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        emailStackView.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 40).isActive = true
        emailStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        emailStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        //        view.addSubview(emailLabel)
        //        view.addSubview(emailTextField)
        //        view.addSubview(passwordLabel)
        //        view.addSubview(passwordTextField)
        //        view.addSubview(submitButton)
        //
        
        //
        //        emailLabel.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 40).isActive = true
        //        emailLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        //
        //        emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 4).isActive = true
        //        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        //        emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        //        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //
        //        passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20).isActive = true
        //        passwordLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        //
        //        passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 4).isActive = true
        //        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        //        passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        //        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //
        //        submitButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40).isActive = true
        //        submitButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        //        submitButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        //        submitButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let value = textField.text {
            print(value)
        }
        return true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailTextField.delegate = self
        passwordTextField.delegate = self
        submitButton.addTarget(self, action: #selector(onSubmit), for: .touchUpInside)
    }
    
    @objc func onSubmit() {
        print("Awea")
    }
    
    
}

