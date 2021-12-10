//
//  SignUpViewController.swift
//  iRow
//
//  Created by Jake Stone on 12/7/21.
//

import UIKit

class SignUpViewController: ViewController {
    
    @IBOutlet weak var EmailField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    @IBOutlet weak var VerifyField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.EmailField.delegate = self
        self.PasswordField.delegate = self
        self.VerifyField.delegate = self
        // Do any additional setup after loading the view.
    }
     
    @IBAction func cancelPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "Sign up to Main", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func validateFields() -> Bool {
        
        let pwOk = self.isEmptyOrNil(password: self.PasswordField.text)
        if !pwOk {
            print(NSLocalizedString("Invalid password", comment: ""))
        }
        
        let pwMatch = self.PasswordField.text == self.VerifyField.text
        if !pwMatch {
            print(NSLocalizedString("Passwords do not match.", comment: ""))
        }
        
        let emailOk = self.isValidEmail(emailStr: self.EmailField.text)
        if !emailOk {
            print(NSLocalizedString("Invalid email address", comment: ""))
        }
        
        return emailOk && pwOk && pwMatch
    }
      

}

extension SignUpViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.EmailField {
            self.PasswordField.becomeFirstResponder()
        } else if textField == self.PasswordField {
            self.VerifyField.becomeFirstResponder()
        } else {
            if self.validateFields() {
                print(NSLocalizedString("Congratulations!  You entered correct values.", comment: ""))
            }
        }
        return true
    }
}

