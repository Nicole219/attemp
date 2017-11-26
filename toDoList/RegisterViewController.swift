//
//  RegisterViewController.swift
//  toDoList
//
//  Created by Goodworkapps on 05.11.17.
//  Copyright © 2017 OurTeam. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    @IBOutlet weak var newName: UITextField!
    @IBOutlet weak var newEmail: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var repeatPassword: UITextField!
    
    @IBAction func onSignUp(_ sender: Any) {
        
       guard let username = newName.text,
        username != "",
        let email = newEmail.text,
        email != "",
        let password = newPassword.text,
        password != ""
        else {
            AlertController.showAlert(self, title: "Ошибка", messege: "Пожалуйста, заполните все поля")
            return
        }
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
            guard error == nil else {
                AlertController.showAlert(self, title: "Ошибка", messege: error!.localizedDescription)
                return
            }
            guard let user = user else {return}
            print(user.email ?? "Введите email")
            print(user.uid)
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = username
            changeRequest.commitChanges(completion: {(error) in
                guard error == nil else {
                    AlertController.showAlert(self, title: "Ошибка", messege: error!.localizedDescription)
                    return
                }
               self.performSegue(withIdentifier: "signUpSegue", sender: nil)
            })
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
}
