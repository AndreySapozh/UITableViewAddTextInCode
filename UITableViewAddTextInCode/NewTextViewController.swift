//
//  NewTextViewController.swift
//  UITableViewAddTextInCode
//
//  Created by Андрей Сапожников on 30.04.2022.
//

import UIKit

protocol AddTextDelegate {
    func addText(text: Text)
}

class NewTextViewController: UIViewController {
    
    var delegate: AddTextDelegate?
    
    var textField = UITextField()
    var inputText = Text(text:"")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        displayBarButtons()
        view.addSubview(textField)
        displayTextField()
        updateSaveButtonState()
        textField.addTarget(self, action: #selector(self.textFieldDidChange), for: UIControl.Event.editingChanged)
}
    
    private func updateSaveButtonState() {
        let inputText = textField.text ?? ""
        navigationItem.rightBarButtonItem?.isEnabled = !inputText.isEmpty
    }
    
    private func displayBarButtons() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(buttonCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(handleSave))
    }
    
    @objc func textFieldDidChange() {
        updateSaveButtonState()
    }
    
    func displayTextField() {
        textField.backgroundColor = .white
        textField.placeholder = "enter text"
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textField.widthAnchor.constraint(equalToConstant: view.frame.width - 64).isActive = true
        textField.becomeFirstResponder()
        
    }
    
     @objc private func buttonCancel() {
         dismiss(animated: true, completion: nil)
    }
    
    @objc private func handleSave() {
        guard let text = textField.text, textField.hasText else { return }
        let newText = Text(text: text)
        delegate?.addText(text: newText)
    }
    
}
