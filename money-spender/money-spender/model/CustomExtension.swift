//
//  CustomExtension.swift
//  money-spender
//
//  Created by Marcin Rosół on 30/11/2020.
//

import UIKit

extension UITextField {
    
    func addToolBar(title: String,
                    style: UIBarButtonItem.Style,
                    target: AnyObject?,
                    selector: Selector?){
        let barButtonItem = UIBarButtonItem()
        barButtonItem.title = title
        barButtonItem.style = style
        barButtonItem.target = target
        barButtonItem.action = selector
        
        let toolbar: UIToolbar = {
            let toolbar = UIToolbar(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 44.0))) //brzydkie ale naprawilo bledy
            toolbar.setItems([barButtonItem], animated: false)
            toolbar.sizeToFit()
            toolbar.barStyle = .default
            return toolbar
        }()
        self.inputAccessoryView = toolbar
        
    }
}
