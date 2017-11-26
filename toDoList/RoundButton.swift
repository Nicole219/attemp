//
//  RoundButton.swift
//  toDoList
//
//  Created by Goodworkapps on 11.11.17.
//  Copyright © 2017 OurTeam. All rights reserved.
//

import UIKit
@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var cornerRadius:CGFloat = 20 {
 didSet   {
         self.layer.cornerRadius = cornerRadius
        }
        
    }
   
    
    

}
