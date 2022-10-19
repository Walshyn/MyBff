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
    
    private let openAI : NetworkSettings = NetworkSettings()
    private let sentime = SentimentsRecognizer()
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        usrField.delegate = self
        
        
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        sentime.predictSentiment(from: textField.text!)
        iaResponse.text = recoverOpenAIResponse(prompt: textField.text ?? "")
        sentiments()
        
        
    
        return true
    }
    
    func sentiments(){
        
    }
    
    private func recoverOpenAIResponse(name : String = "Moi", prompt : String) -> String?{
        if(prompt.isEmpty){
            print("Error: prompt is empty")
            return ""
        }
        else
        {
            let prompt = "\(name): \(prompt)\nAmi:"
            print(prompt)
            return openAI.processPrompt(prompt: prompt)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
    
        var sentimentsReco = SentimentsRecognizer()
        var sentiment = sentimentsReco.predictSentiment(from: textField.text!)
        print(sentiment)
        switch sentiment{
        case .sad:
            avatarIA.image = Sentiments.sad.imageAI
        case .neutral:
            avatarIA.image = Sentiments.neutral.imageAI
        case .happy:
            avatarIA.image = Sentiments.happy.imageAI
        }
    }
}
