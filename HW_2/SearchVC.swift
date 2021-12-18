//
//  ViewController.swift
//  HW_2
//
//  Created by Даниил Алексеев on 06.10.2021.
//

import UIKit


class SearchVC: UIViewController, UITextFieldDelegate {
    // MARK: - UI components
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var Button: UIButton!
    
    // MARK: - UI components DidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: -  UI configure func
    func configureUI(){
        Button.layer.cornerRadius = 20
        self.textField.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barStyle = .black
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        Button.isEnabled = false
    }
    
    // MARK: -  Dismiss Keyboard on return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    // MARK: - Dismiss Keyboard on tap
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - Dismiss Keyboard on tap
    @IBAction func properTextFieldWork(_ sender: Any) {
        if let text = textField.text, text.isEmpty {
            Button.isEnabled = false
        } else {
            Button.isEnabled = true
        }
    }
    
    // MARK: - Search func
    @IBAction func search(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "ResultVC") as! ResultVC
        vc.authorLabelText = textField.text
        self.navigationController?.pushViewController(vc, animated: true)
        textField.resignFirstResponder()
    }
}


