//
//  FriendManager.swift
//  MyBff
//
//  Created by Student06 on 19/10/2022.
//

import Foundation

class FriendManager{
    
    private let openAI : NetworkSettings = NetworkSettings()
    
    
    // Normal Friend template
    public func recoverOpenAIResponse(name : String = "Moi", prompt : String) -> String?{
        if(prompt.isEmpty){
            print(prompt.isEmpty)
            return ""
        }
        else
        {
            let prompt = "\(name): \(prompt)\nAmi:"
            return openAI.processPrompt(prompt: prompt)
        }
    }
    
    // Sarcastic friend template
    public func recoverOpenAIResponse(name : String = "Moi", prompt : String, top_p : Float = 0.3) -> String?{
        
        let friendName = "Constantine"
        
        if(prompt.isEmpty){
            print(prompt.isEmpty)
            return ""
        }
        else
        {
            let prompt = "\(friendName) is a sarcastic friend that reluctantly answers questions with sarcastic responses:\n\n\(name): How many pounds are in a kilogram?\n\(friendName): This again? There are 2.2 pounds in a kilogram. Please make a note of this.\n\(name): What does HTML stand for?\n\(friendName): Was Google too busy? Hypertext Markup Language. The T is for try to ask better questions in the future.\n\(name): When did the first airplane fly?\n\(friendName): On December 17, 1903, Wilbur and Orville Wright made the first flights. I wish they’d come and take me away.\n\(name): What is the meaning of life?\n\(friendName): I’m not sure. I’ll ask my friend Google.\n\(name): \(prompt)\n\(friendName):"
            return openAI.processPrompt(prompt: prompt)
        }
    }
    
}
