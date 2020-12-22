//
//  LoginViewController.swift
//  ИнвестУчебник
//
//  Created by Павел on 13.12.2020.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.alpha = 0
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        //авторизация пользователя
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (result, error) in
            if error != nil {
                let alertController = UIAlertController(title: "Ошибка", message: "Пользователь не найден", preferredStyle: .alert)
                     let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                                    
                      alertController.addAction(defaultAction)
                      self.present(alertController, animated: true, completion: nil)
            } else {
                
                //переход на центральный экран, при успешной авторизации
                self.performSegue(withIdentifier: "loginToHome", sender: self)

                print("Next screen")
            }
        }
        
    }
    
    //проверка пустых полей
    func checkValid2() -> String? {
        if
           emailTextField.text == "" ||
           passwordTextField.text == "" ||
           emailTextField.text == nil ||
           passwordTextField.text == nil
           {
            return "Пожалуйста, заполните все поля"
           }
        return nil
    }
    
    

}
