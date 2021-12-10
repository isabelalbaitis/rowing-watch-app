//
//  LogInViewController.swift
//  iRow
//
//  Created by Jake Stone on 12/7/21.
//

import UIKit

class LogInViewController: ViewController {
    
    @IBOutlet weak var EmailField: UITextField!
    @IBOutlet weak var PassField: UITextField!
    @IBOutlet weak var LogInButton: UIButton!
    @IBOutlet weak var SignUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // dismiss keyboard when tapping outside of text fields
        let detectTouch = UITapGestureRecognizer(target: self, action:
        #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(detectTouch)
                                          
        // make this controller the delegate of the text fields.
        self.EmailField.delegate = self
        self.PassField.delegate = self
    }
    
    @objc func dismissKeyboard() {
      self.view.endEditing(true)
    }
    
    func validateFields() -> Bool {
        let pwOk = self.isEmptyOrNil(password: self.PassField.text)
        if !pwOk {
            self.validationErrors += "Password cannot be blank."
        }

        let emailOk = self.isValidEmail(emailStr: self.EmailField.text)
        if !emailOk {
            self.validationErrors += "Invalid email address."
        }

        return emailOk && pwOk
    }


    @IBAction func signInPressed(_ sender: Any) {
        if self.validateFields() {
            print("Congratulations!  You entered correct values.")
            let repo = iRowRepository.getInstance()
            repo.signIn(email: self.EmailField.text!, password: self.PassField.text!) {(success, errorMesg) in
                if success {
                    self.performSegue(withIdentifier: "LogInToMain", sender: self)
                }
                else {
                    if let msg = errorMesg {
                        self.reportError(msg: msg)
                    }
                    self.PassField.text = ""
                    self.PassField.becomeFirstResponder()
                }
            }
        } else {
            self.reportError(msg: self.validationErrors)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension LogInViewController : UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField == self.EmailField {
      self.PassField.becomeFirstResponder()
    } else {
      if self.validateFields() {
        print(NSLocalizedString("Congratulations!  You entered correct values.", comment: ""))
      }
    }
    return true
  }
}
