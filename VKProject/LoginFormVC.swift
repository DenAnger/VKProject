//
//  LoginFormVC.swift
//  VKProject
//
//  Created by Denis Abramov on 27.07.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import UIKit

class LoginFormVC: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var loginTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hiddenKeyboard()
    }
    
    // MARK: Keyboard
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillBeHidden(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    func hiddenKeyboard() {
        let hideKeyboardGesture = UITapGestureRecognizer(
            target: self, action: #selector(self.hideKeyboard))
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
    
    func isUserDataCorrect() -> Bool {
        if loginTF.text == "a" && passwordTF.text == "1" {
            return true
        } else {
            return false
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Error",
                                      message: "Incorrect data",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        let info = notification.userInfo! as NSDictionary
        
        let keyboardSize = (info.value(
            forKey: UIResponder.keyboardFrameEndUserInfoKey
            ) as! NSValue).cgRectValue.size
        
        let contentInsets = UIEdgeInsets(top: 0.0,
                                         left: 0.0,
                                         bottom: keyboardSize.height,
                                         right: 0.0)
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(notification: NSNotification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
    // MARK: Navigation
    
    override func shouldPerformSegue(withIdentifier identifier: String,
                                     sender: Any?) -> Bool {
        if isUserDataCorrect() {
            return true
        } else {
            showAlert()
            return false
        }
    }

    @IBAction func signInButtonPressed(_ sender: Any) {
    }
}
