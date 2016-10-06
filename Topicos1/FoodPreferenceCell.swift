//
//  FoodPreferenceCell.swift
//  Topicos1
//
//  Created by Matheus Pedreira on 9/23/16.
//  Copyright © 2016 Matrpedreira. All rights reserved.
//

import UIKit

class FoodPreferenceCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var `switch`: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCell(comida:Comida) {
        label.text = comida.nome
        `switch`.isOn = comida.preferido
        if (`switch`.isOn) {
            label.textColor = appColor
        } else {
            label.textColor = UIColor.darkGray
        }
    }

    @IBAction func switchChanged(_ sender: AnyObject) {
        if (`switch`.isOn) {
            label.textColor = appColor
        } else {
            label.textColor = UIColor.darkGray
        }
        Entidades.sharedInstance.updatePreferido(comidaNome: label.text!,state: `switch`.isOn)
    }

}
