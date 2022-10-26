//
//  Constants.swift
//  DBNavigatorClone
//
//  Created by Jonas Gamburg on 24.10.22.
//

import SwiftUI

enum Constants {
    
    //MARK: - Color
    enum Color {
        case red
        case darkGrey
        case lightGrey
        case background
        
        var uiColor: UIColor {
            switch self {
            case .red:        return .init(red: 237/255, green: 28/255,  blue: 36/255, alpha: 1)
            case .darkGrey:   return .init(red: 45/255,  green: 45/255,  blue: 45/255, alpha: 1)
            case .lightGrey:  return .init(red: 131/255, green: 131/255, blue: 131/255, alpha: 1)
            case .background: return .init(red: 240/255, green: 237/255, blue: 239/255, alpha: 1)
            }
        }
    }
    
    //MARK: - Media
    enum Media: String {
        case dbahnLogo = "DbahnLogo"
        
        var uiImage: UIImage {
            switch self {
            case .dbahnLogo: return .init(named: rawValue)!
            }
        }
    }
    
    //MARK: - Symbol
    enum Symbol: String {
        case arrowsLeftRight  = "arrow.left.arrow.right"
        case arrowForward     = "arrow.forward"
        case arrowsSwap       = "arrow.triangle.swap"
        case magnifyingGlass  = "magnifyingglass"
        case gear             = "gearshape.fill"
        case plus             = "plus"
        case minus            = "minus"
        case personFill       = "person.fill"
        case personsConnected = "person.line.dotted.person"
    }
}
