//
//  ViewController.swift
//  iRow
//
//  Created by Isabel Albaitis and Jacob Stone on 10/29/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func isValidPassword(password: String?) -> Bool
    {
        guard let s = password, s.lowercased().range(of: "erg") != nil else {
            return false
        }
        return true
    }
    
    func isEmptyOrNil(password: String?) -> Bool
    {
        guard let s = password, s != "" else {
            return false
        }
        return true
    }
    
    func isValidEmail(emailStr : String? ) -> Bool
    {
        var emailOk = false
        if let email = emailStr {
            let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            
            let emailPredicate = NSPredicate(format:"SELF MATCHES %@", regex)
            emailOk = emailPredicate.evaluate(with: email)
        }
        return emailOk
    }
}


