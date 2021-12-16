//
//  HomeViewController.swift
//  TelaLogin
//
//  Created by user201951 on 12/16/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        logoutButton.addTarget(self, action: #selector(logoutObjC), for: .touchUpInside)
    }
    
    @objc func logoutObjC() {
        logout()
    }

    func logout() {
        UserDefaults.standard.removeObject(forKey: "login")
        UserDefaults.standard.removeObject(forKey: "password")
        navigationController?.popViewController(animated: true)
    }
}
