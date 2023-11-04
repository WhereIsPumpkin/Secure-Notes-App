//
//  PaddedTextField.swift
//  Notes App
//
//  Created by Saba Gogrichiani on 05.11.23.
//

import UIKit

class PaddedTextField: UITextField {
    var textPadding = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}

