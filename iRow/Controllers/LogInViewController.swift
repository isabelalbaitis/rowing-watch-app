//
//  LogInViewController.swift
//  iRow
//
//  Created by Jake Stone on 12/7/21.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
