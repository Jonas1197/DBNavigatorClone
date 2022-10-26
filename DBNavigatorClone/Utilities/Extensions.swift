//
//  Extensions.swift
//  DBNavigatorClone
//
//  Created by Jonas Gamburg on 24.10.22.
//

import UIKit

//MARK: - UIApplication
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
