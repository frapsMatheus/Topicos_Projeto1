//
//  Comida.swift
//  Topicos1
//
//  Created by Matheus Pedreira on 9/23/16.
//  Copyright © 2016 Matrpedreira. All rights reserved.
//

import UIKit
import RealmSwift

class Comida:Object {
    dynamic var nome = ""
    dynamic var preferido = false
    dynamic var calorias = 0

    override class func primaryKey() -> String? {
        return "nome"
    }
}

class Tipo:Object {
    dynamic var tipo = ""

    override class func primaryKey() -> String? {
        return "tipo"
    }
}

enum Horarios:Int {
    case cafe = 0
    case almoco = 1
    case janta = 2
}

class Cardapio:Object {
    dynamic var dia = NSDate(timeIntervalSince1970: 1)
    dynamic var refeicao = -1
    var comidas = List<Comida>()
    dynamic var nota = 0
}


protocol EntidadesProtocol {
    func updated()
}

class Entidades {
    
    static let sharedInstance = Entidades()

    let tiposString = ["Salada","Molho","Prato Principal","Guarnição","Prato Vegetariano", "Complementos", "Sobremesa",
                 "Bebida", "Sopa", "Pão", "Bebidas Quentes", "Bebidas Quentes Vegetarianas", "Achocolatado", "Iorgute",
                 "Iorgute Vegetariano", "Complemento", "Complemento Vegetariano", "Proteína", "Proteína Vegetariana",
                 "Fruta","Suco"]

    let comidasDictionary = [["Nome":"Leite, café, chá de camomila","Calorias":170],
                             ["Nome":"Leite de soja","Calorias":150],
                             ["Nome":"Achocolatado sem leite","Calorias":200],
                             ["Nome":"Iogurte natural integral","Calorias":160],
                             ["Nome":"Iogurte de soja","Calorias":60],
                             ["Nome":"Pão francês","Calorias":30],
                             ["Nome":"Manteiga","Calorias":50],
                             ["Nome":"Creme vegetal","Calorias":100],
                             ["Nome":"Ovos mexidos","Calorias":150],
                             ["Nome":"Geléia","Calorias":80],
                             ["Nome":"Laranja","Calorias":90],
                             ["Nome":"Umbu","Calorias":120],

                             ["Nome":"Alface roxa e picles","Calorias":130],
                             ["Nome":"Molho de salsa","Calorias":40],
                             ["Nome":"Lasanha à bolonhesa","Calorias":75],
                             ["Nome":"Seleta de legumes","Calorias":80],
                             ["Nome":"Lasanha de abobrinha","Calorias":90],
                             ["Nome":"Arroz branco, arroz integral e Feijão", "Calorias":120],
                             ["Nome":"Maçã", "Calorias":110],
                             ["Nome":"Tangerina", "Calorias":80],

                             ["Nome":"Repolho e pepino","Calorias":30],
                             ["Nome":"Molho de mostarda e mel","Calorias":20],
                             ["Nome":"Sopa de abóbora com agrião","Calorias":15],
                             ["Nome":"Torrada","Calorias":10],
                             ["Nome":"Peixe a gomes de Sá","Calorias":300],
                             ["Nome":"Bobó de soja","Calorias":150],
                             ["Nome":"Mamão","Calorias":160],
                             ["Nome":"Limão","Calorias":100]]

    let menusDictionary = [
        ["Dia":"2016-09-23" , "Horario":"Café", "Pratos":["Leite, café, chá de camomila","Leite de soja","Achocolatado sem leite",
                                                           "Iogurte natural integral","Iogurte de soja","Pão francês","Manteiga","Creme vegetal","Ovos mexidos","Geléia"
            ,"Laranja","Umbu"]],
        ["Dia":"2016-09-23" , "Horario":"Almoço", "Pratos":["Alface roxa e picles","Molho de salsa"
            ,"Lasanha à bolonhesa","Seleta de legumes","Lasanha de abobrinha","Arroz branco, arroz integral e Feijão",
             "Maçã", "Tangerina"]],
        ["Dia":"2016-09-23" , "Horario":"Janta", "Pratos":["Repolho e pepino","Molho de mostarda e mel","Sopa de abóbora com agrião",
                                                           "Torrada","Peixe a gomes de Sá","Bobó de soja","Mamão","Limão"]],


        ["Dia":"2016-09-24" , "Horario":"Café", "Pratos":[
            "Iogurte natural integral","Iogurte de soja","Pão francês","Manteiga","Creme vegetal","Ovos mexidos","Geléia"
            ,"Laranja","Umbu"]],
        ["Dia":"2016-09-24" , "Horario":"Almoço", "Pratos":["Alface roxa e picles","Molho de salsa"
            ,"Lasanha à bolonhesa","Seleta de legumes","Lasanha de abobrinha","Arroz branco, arroz integral e Feijão",
             "Maçã", "Tangerina"]],
        ["Dia":"2016-09-24" , "Horario":"Janta", "Pratos":["Repolho e pepino","Molho de mostarda e mel","Sopa de abóbora com agrião",
                                                           "Torrada","Peixe a gomes de Sá","Bobó de soja","Mamão","Limão"]],
        ["Dia":"2016-09-25" , "Horario":"Café", "Pratos":["Leite, café, chá de camomila","Leite de soja","Achocolatado sem leite",
                                                           "Iogurte natural integral","Iogurte de soja","Pão francês","Manteiga","Creme vegetal","Ovos mexidos","Geléia"
            ,"Laranja","Umbu"]],
        ["Dia":"2016-09-25" , "Horario":"Almoço", "Pratos":["Alface roxa e picles","Molho de salsa"
            ,"Lasanha à bolonhesa","Seleta de legumes",
             "Maçã", "Tangerina"]],
        ["Dia":"2016-09-25" , "Horario":"Janta", "Pratos":["Repolho e pepino","Molho de mostarda e mel","Sopa de abóbora com agrião",
                                                           "Torrada","Mamão","Limão"]],
        ["Dia":"2016-09-26" , "Horario":"Café", "Pratos":["Leite, café, chá de camomila","Leite de soja","Achocolatado sem leite",
            "Iogurte natural integral","Iogurte de soja","Pão francês","Manteiga","Creme vegetal","Ovos mexidos","Geléia"
            ,"Laranja","Umbu"]],
        ["Dia":"2016-09-26" , "Horario":"Almoço", "Pratos":["Alface roxa e picles","Molho de salsa"
        ,"Lasanha à bolonhesa","Seleta de legumes","Lasanha de abobrinha","Arroz branco, arroz integral e Feijão",
         "Maçã", "Tangerina"]],
        ["Dia":"2016-09-26" , "Horario":"Janta", "Pratos":["Repolho e pepino","Molho de mostarda e mel","Sopa de abóbora com agrião",
            "Torrada","Peixe a gomes de Sá","Bobó de soja","Mamão","Limão"]],


        ["Dia":"2016-09-27" , "Horario":"Café", "Pratos":[
                                                           "Iogurte natural integral","Iogurte de soja","Pão francês","Manteiga","Creme vegetal","Ovos mexidos","Geléia"
            ,"Laranja","Umbu"]],
        ["Dia":"2016-09-27" , "Horario":"Almoço", "Pratos":["Alface roxa e picles","Molho de salsa"
            ,"Lasanha à bolonhesa","Seleta de legumes","Lasanha de abobrinha","Arroz branco, arroz integral e Feijão",
             "Maçã", "Tangerina"]],
        ["Dia":"2016-09-27" , "Horario":"Janta", "Pratos":["Repolho e pepino","Molho de mostarda e mel","Sopa de abóbora com agrião",
                                                           "Torrada","Peixe a gomes de Sá","Bobó de soja","Mamão","Limão"]],
        ["Dia":"2016-09-28" , "Horario":"Café", "Pratos":["Leite, café, chá de camomila","Leite de soja","Achocolatado sem leite",
                                                           "Iogurte natural integral","Iogurte de soja","Pão francês","Manteiga","Creme vegetal","Ovos mexidos","Geléia"
            ,"Laranja","Umbu"]],
        ["Dia":"2016-09-28" , "Horario":"Almoço", "Pratos":["Alface roxa e picles","Molho de salsa"
            ,"Lasanha à bolonhesa","Seleta de legumes",
             "Maçã", "Tangerina"]],
        ["Dia":"2016-09-28" , "Horario":"Janta", "Pratos":["Repolho e pepino","Molho de mostarda e mel","Sopa de abóbora com agrião",
                                                           "Torrada","Mamão","Limão"]],
        ]

    var realm:Realm!

    var tipos = Array<Tipo>()
    var comidas = Array<Comida>()

    var observers = Array<EntidadesProtocol>()

    init() {
        realm = try! Realm()
        var realmTipos = realm.objects(Tipo.self)
        if realmTipos.count == 0 {
            for tipoString in tiposString {
                let novoTipo = Tipo()
                novoTipo.tipo = tipoString
                try! realm.write {
                    realm.add(novoTipo)
                }
            }
        }
        realmTipos = realm.objects(Tipo.self)
        tipos = Array(realmTipos)
        var realmComidas = realm.objects(Comida.self)
        if realmComidas.count == 0 {
            for element in comidasDictionary {
                let novaComida = Comida()
                novaComida.nome = element["Nome"]! as! String
                novaComida.calorias = element["Calorias"] as! Int
                try! realm.write {
                    realm.add(novaComida)
                }
            }
        }
        realmComidas = realm.objects(Comida.self)
        comidas = Array(realmComidas)
        var realmCardapios = realm.objects(Cardapio.self)
        if (realmCardapios.count == 0) {
            for element in menusDictionary {
                let cardapio = Cardapio()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                cardapio.dia = dateFormatter.date(from: element["Dia"] as! String) as! NSDate
                if ((element["Horario"] as! String) == "Café") {
                    cardapio.refeicao = Horarios.cafe.rawValue
                } else if ((element["Horario"] as! String) == "Almoço") {
                    cardapio.refeicao = Horarios.almoco.rawValue
                } else {
                    cardapio.refeicao = Horarios.janta.rawValue
                }
                for prato in (element["Pratos"] as! NSArray) {
                    let filtered = comidas.filter{ $0.nome == (prato as! String) }
                    if (!filtered.isEmpty) {
                        cardapio.comidas.append(filtered.first!)
                    }
                }
                try! realm.write {
                    realm.add(cardapio)
                }
            }
        }
        notifyObservers()
    }


    func subscribe(observer:EntidadesProtocol) {
        observers.append(observer)
        observer.updated()
    }

    func notifyObservers()
    {
        for observer in observers {
            observer.updated()
        }
    }

    func updatePreferido(comidaNome:String, state:Bool) {
        let filtered = comidas.filter{ $0.nome == comidaNome}
        let comida = filtered.first!
        try! realm.write {
            comida.preferido = state
            notifyObservers()
        }
    }

}
