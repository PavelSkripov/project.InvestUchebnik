//
//  AuthViewController.swift
//  ИнвестУчебник
//
//  Created by Павел on 13.12.2020.
//

import UIKit
import Firebase
import FirebaseAuth

class AuthViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func singInPressed(_ sender: Any) {
    }
    
    @IBAction func LoginPressed(_ sender: Any) {
    }
    
    //отслеживание пользовательского входа в профиль
    override func viewDidAppear(_ animated: Bool){
     super.viewDidAppear(animated)
     if Auth.auth().currentUser != nil {
       self.performSegue(withIdentifier: "alreadyLoggedIn", sender: nil)
    }
}
    
    
    
}


