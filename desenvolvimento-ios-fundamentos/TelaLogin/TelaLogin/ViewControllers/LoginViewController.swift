//
//  LoginViewController.swift
//  TelaLogin
//
//  Created by user201951 on 12/16/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        passwordTextField.isSecureTextEntry = true
        loginButton.addTarget(self, action: #selector(saveObjC), for: .touchUpInside)
    }
    
    @objc func saveObjC() {
        save()
    }
    
    func save() {
        let login = loginTextField.text
        let password = passwordTextField.text
        let homeViewController = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "homeViewControllerID") as! HomeViewController
        
        if !isEmailValid(login: login ?? "") {
            alertUser()
        } else {
            userDefaults.setValue(login, forKey: "login")
            userDefaults.setValue(password, forKey: "password")
            navigationController?.pushViewController(homeViewController, animated: true)
        }
    }
    
    func isEmailValid(login: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        
        return emailPredicate.evaluate(with: login)
    }
    
    func alertUser() {
        let alert = UIAlertController(title: "Erro", message: "E-mail não é válido", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
