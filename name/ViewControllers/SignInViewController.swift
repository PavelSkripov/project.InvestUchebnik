//
//  SighInViewController.swift
//  ИнвестУчебник
//
//  Created by Павел on 13.12.2020.
//

import UIKit
import Firebase
import FirebaseAuth

class SignInViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.alpha = 0
    }
    
//регистрация пользователя в приложении, отправка данных в базу Cloud Firestore
    @IBAction func signInButtonPressed(_ sender: Any) {
        if checkValid() != nil  {
            errorLabel.alpha = 1
            errorLabel.text = checkValid()
            errorLabel.textColor = UIColor.red
        } else {
            //создание пользователя
            Auth.auth().createUser(withEmail:
            //из полей ввода убираются пробелы
             emailTextField.text!.replacingOccurrences(of: " ", with: ""), password: passwordTextField.text!.replacingOccurrences(of: " ", with: "")) { [self] (result, error) in
                if error != nil {
                    self.errorLabel.text = "Не удается создать пользователя"
                } else {
                    //создание записей в базе данных
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: [
                        "firstName": self.firstNameTextField.text!.replacingOccurrences(of: " ", with: ""),
                        "email": self.emailTextField.text!.replacingOccurrences(of: " ", with: ""),
                        "uid": result!.user.uid
                    ]) { (error) in
                        if error != nil {
                            
                            self.errorLabel.text = "Не удается создать пользователя"
                        }
                        print(result!.user.uid)
                    }
                    //переход на центральный экран, при успешной регистрации
                    self.performSegue(withIdentifier: "signupToHome", sender: nil)
                    
                    UserDefaults.standard.removeObject(forKey: DefaultsKey.keyAnd)
                    UserDefaults.standard.removeObject(forKey: DefaultsKey.keyCurrentIndex)
                    UserDefaults.standard.removeObject(forKey: DefaultsKey.keyProgress)
                    UserDefaults.standard.removeObject(forKey: DefaultsKey.keyNameLabel)
                    
                    print("Next screen")
                }
            }
        }
    }
    
    //функция проверяет ввод значений без пустой строки и отсутсвия значений
    func checkValid() -> String? {
        if firstNameTextField.text == "" ||
           emailTextField.text == "" ||
           passwordTextField.text == "" ||
           firstNameTextField.text == nil ||
           emailTextField.text == nil ||
           passwordTextField.text == nil
           {
            return "Пожалуйста, заполните все поля"
           }
        return nil
    }
}
