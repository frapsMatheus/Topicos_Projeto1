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
    var tipo:Tipo? = nil

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
    case cafe
    case almoco
    case janta
}

class Cardapio:Object {
    dynamic var dia:Date? = nil
    var refeicao:Horarios? = nil
    let dogs = Array<Comida>()
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

    let comidasDictionary = [["Nome":"Alface roxa e picles","Tipo":"Salada"],
                             ["Nome":"Molho de salsa","Tipo":"Molho"],
                             ["Nome":"Lasanha à bolonhesa","Tipo":"Prato Principal"],
                             ["Nome":"Seleta de legumes","Tipo":"Guarnição"],
                             ["Nome":"Lasanha de abobrinha","Tipo":"Prato Vegetariano"],
                             ["Nome":"Arroz branco, arroz integral e Feijão", "Tipo":"Complementos"],
                             ["Nome":"Maçã", "Tipo":"Sobremesa"],
                             ["Nome":"Tangerina", "Tipo":"Suco"]]


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
                novaComida.nome = element["Nome"]!
                let filtered = tipos.filter{ $0.tipo == element["Tipo"]! }
                novaComida.tipo = filtered.first!
                try! realm.write {
                    realm.add(novaComida)
                }
            }
        }
        realmComidas = realm.objects(Comida.self)
        comidas = Array(realmComidas)
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
        }
    }

}
