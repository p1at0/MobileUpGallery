//
//  ViewController.swift
//  MobUpGallery
//
//  Created by Абдулла Залимханов on 25.07.2021.
//

import UIKit

class AuthViewController: UIViewController {
    
    private var authService: AuthService!
    
    @IBAction func signIn(_ sender: UIButton) {
        authService.wakeUpSession()
    }
    
    @IBOutlet weak var signInConstraints: UIButton! {
        didSet {
            signInConstraints.layer.cornerRadius = 8
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        
        authService = SceneDelegate.shared().authService
    }
    
    
}
