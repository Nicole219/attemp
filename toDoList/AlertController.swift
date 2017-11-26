//
//  AlertController.swift
//  toDoList
//
//  Created by Goodworkapps on 25.11.17.
//  Copyright © 2017 OurTeam. All rights reserved.
//

import  UIKit

class AlertController {
    static func showAlert (_ inVewController: UIViewController, title: String, messege: String){
        let alert = UIAlertController(title: title, message: messege, preferredStyle: .alert)
        let action = UIAlertAction (title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        inVewController.present(alert, animated: true, completion: nil)
    }
}
