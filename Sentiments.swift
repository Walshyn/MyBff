//
//  Sentiments.swift
//  MyBff
//
//  Created by Carme on 18/10/2022.
//

import Foundation
import UIKit

enum Sentiments {
    case happy
    case sad
    
    var imageAI: UIImage? {
        switch self {
        case .happy:
            return UIImage(named: "happy")
        case .sad:
            return UIImage(named: "sad")
        }
    }
}
