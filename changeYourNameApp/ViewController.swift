//
//  ViewController.swift
//  changeYourNameApp
//
//  Created by Christian Pérez on 07-09-23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var convertedNameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    var name:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideData()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = nameTextField.text {
            name = text
        }
    }
    
    @IBAction func botonAction(_ sender: Any) {
        if let enteredName = nameTextField.text {
            if !enteredName.isEmpty {
                let invertedName = Array(enteredName)
                let name = invertedName.reversed()
                let nameOk = String(name)
                imageView.image = UIImage(named: "risa-jaja")
                convertedNameLabel.text = nameOk
                convertedNameLabel.isHidden = false
                titleLabel.isHidden = false
                backButton.isHidden = false
                imageView.isHidden = false
                UIView.animate(withDuration: 1.0) {
                    let randomX = CGFloat(arc4random_uniform(UInt32(self.view.bounds.width)))
                    let randomY = CGFloat(arc4random_uniform(UInt32(self.view.bounds.height)))
                    self.imageView.center = CGPoint(x: randomX, y: randomY)
                }
            } else {
                sendAlert()
            }
        }
    }
    
    @IBAction func deleteAction(_ sender: Any) {
        hideData()
        nameTextField.text = ""
    }
    
    func sendAlert(){
        let alerta = UIAlertController(title: "Error", message: "Ingresa tu nombre", preferredStyle: .alert)
        let accionAceptar = UIAlertAction(title: "Volver", style: .default, handler: nil)
        alerta.addAction(accionAceptar)
        present(alerta, animated: true, completion: nil)
    }
    
    func hideData(){
        convertedNameLabel.isHidden = true
        titleLabel.isHidden = true
        backButton.isHidden = true
        imageView.isHidden = true
    }
}

