//
//  InformationViewController.swift
//  ruunb
//
//  Created by Yan Correa Trindade on 9/30/16.
//  Copyright © 2016 Yi Mobile. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentTextView: UITextView!

    var titleArray = ["POLÍTICA DE USO", "CONTATOS"]
    var contentFile = ["1. Não fure a fila. 2. Não guarde lugar. 3. Não converse enquanto se serve. 4. Não é permitido deixar o refeitório portando canecas, talheres, pratos ou alimentos. 5. Devolva na área retorno de pratos os utensílios usados. 6. O usuário poderá acessar o refeitório apenas uma vez para cada refeitação. 7. Sirva-se apenas daqui que for consumir",
                       "DIRETORIA do RU\nDiretora: Ygraine Hartmann Leibovich\nAssistente de Direção: Danilo dos Santos"]
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        self.contentFile[0] = self.contentTextView.text
        // Do any additional setup after loading the view.
    }

    @IBAction func leftButton(sender: AnyObject) {
        if index == 0 {
            index = 1
            self.titleLabel.text = titleArray[index]
            self.contentTextView.text = contentFile[index]
        } else {
            index = 0
            self.titleLabel.text = titleArray[index]
            self.contentTextView.text = contentFile[index]
        }
    }

    @IBAction func rightButton(sender: AnyObject) {
        if index == 0 {
            index = 1
            self.titleLabel.text = titleArray[index]
            self.contentTextView.text = contentFile[index]
        } else {
            index = 0
            self.titleLabel.text = titleArray[index]
            self.contentTextView.text = contentFile[index]
        }
    }


    @IBAction func sair(_ sender: AnyObject) {

        UserDefaults.standard.removeObject(forKey: "user")

        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let initialViewController = storyboard.instantiateInitialViewController()
        UIApplication.shared.keyWindow?.rootViewController = initialViewController
        UIApplication.shared.keyWindow?.makeKeyAndVisible()
        
    }
    
}
