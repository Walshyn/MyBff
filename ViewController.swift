//
//  ViewController.swift
//  MyBff
//
//  Created by Carme on 18/10/2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var avatarIA: UIImageView!
    @IBOutlet var iaResponse: UILabel!
    @IBOutlet var usrField: UITextField!
    override func viewDidLoad() {
    
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        usrField.delegate = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        iaResponse.text = ""
        sentiments()
        return true
    }
    
    func sentiments(){
        if usrField.text!.localizedCaseInsensitiveContains("not"){
            avatarIA.image = UIImage(named: "sad")
            iaResponse.text = "Too bad, what's happening?"
        }else if usrField.text!.localizedCaseInsensitiveContains("happy"){
            avatarIA.image = UIImage(named: "happy")
            iaResponse.text = "I'm so happy for you, what're your plans for today?"
        }
    }
}

