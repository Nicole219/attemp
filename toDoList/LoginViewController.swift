//
//  LoginViewController.swift
//  toDoList
//
//  Created by Goodworkapps on 05.11.17.
//  Copyright © 2017 OurTeam. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginViewController: UIViewController , GIDSignInUIDelegate{

    
    @IBOutlet weak var titleLabel: UILabel!
   // @IBOutlet weak var theLabelError: UILabel!
   
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var pswdTextField: UITextField!
    @IBAction func loginButtonTapped(_ sender: Any) {
        print("Login button is tapped");
        guard let email = nameTextField.text,
            email != "",
            let password = pswdTextField.text,
            password != ""
            else {
                AlertController.showAlert(self, title: "Ошибка", messege: "Пожалуйста, заполните все необходимые поля")
                return
        }
        Auth.auth().signIn(withEmail: email, password: password, completion: {(user, error) in
            guard error == nil else {
                AlertController.showAlert(self, title: "Ошибка", messege: error!.localizedDescription)
                return
            }
            guard let user = user else {return}
            print(user.email ?? "missing EMAIL")
            print(user.displayName ?? "missing DISPLAY NAME")
            print(user.uid)
           // self.performSegue(withIdentifier: "signinSegue", sender: nil)
        })
        
      /*  let usr = "qwerty"
        let pswd = "123"
        if nameTextField.text == usr &&
            pswdTextField.text == pswd
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Navigation") as UIViewController
            self.present(vc, animated: true, completion: nil)
        }
        else {
            titleLabel.text = "Неверный логин или пароль"
            titleLabel.backgroundColor = UIColor.red
        }*/
    }
 
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        
        titleLabel?.numberOfLines = 1
        titleLabel?.adjustsFontSizeToFitWidth = true
        titleLabel?.minimumScaleFactor = 0.1
        
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
