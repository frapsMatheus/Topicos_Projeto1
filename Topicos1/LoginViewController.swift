//
//  LoginViewController.swift
//  Topicos1
//
//  Created by Tiago Pigatto Lenza on 10/7/16.
//  Copyright © 2016 Matrpedreira. All rights reserved.
//

import UIKit
import RealmSwift

class LoginViewController: UIViewController {

    
    @IBOutlet var matriculaTextField: UITextField!
    @IBOutlet var senhaTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        matriculaTextField.layer.borderColor = UIColor.lightText.cgColor
        senhaTextField.layer.borderColor = UIColor.lightText.cgColor
        
    }
    
    @IBAction func login(_ sender: AnyObject) {
        
        let realm = Entidades.sharedInstance.realm
        
        
        let predicate = NSPredicate(format: "matricula = %@ AND senha = %@", matriculaTextField.text!, senhaTextField.text!)
        let user = realm?.objects(User.self).filter(predicate)
        
        if !(user?.isEmpty)! {
            
            UserDefaults.standard.set(true, forKey: "user")
            UserDefaults.standard.synchronize()
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let initialViewController = storyboard.instantiateInitialViewController()
            UIApplication.shared.keyWindow?.rootViewController = initialViewController
            UIApplication.shared.keyWindow?.makeKeyAndVisible()
        }else{
            self.showAlert(withMessage: "Matrícula ou senha inválidas.", inViewController: self)
        }
        
    }
    

    func showAlert(withMessage message : String, inViewController controller : UIViewController) {
        
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        
        controller.present(alertController, animated: true, completion: nil)
    }
    
}
