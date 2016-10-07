//
//  ViewController.swift
//  ruunb
//
//  Created by Yan Correa Trindade on 9/23/16.
//  Copyright © 2016 Yi Mobile. All rights reserved.
//

import UIKit
import HCSStarRatingView

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var weekday: UILabel!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var ratingStars: HCSStarRatingView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var variavelVisual: UILabel!

    var currentDate:Date! = nil

    let one = ["Caçarola marinada (paleta)", "Cuzcuz vegetariano", "Arroz branco, integral, verde", "Molho de salsa"]
    let second = ["Cuzcuz verde", "Salada de Fruta", "Pao de Queijo"]
    let third:NSArray = []
    
    var currentArray:NSArray = []

    var dayFormatter  = DateFormatter()

    var cardapioAtual:Cardapio! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let user = UserDefaults.standard.object(forKey: "user") as? Bool

        if user == nil{
            let storyboard = UIStoryboard(name: "Login", bundle: nil)
            let initialViewController = storyboard.instantiateInitialViewController()
            UIApplication.shared.keyWindow?.rootViewController = initialViewController
            UIApplication.shared.keyWindow?.makeKeyAndVisible()
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dayFormatter.dateFormat = "dd/MM EEE"

        currentDate = dateFormatter.date(from: "2016-09-26")
        
        weekday.text = dayFormatter.string(from: currentDate)
        ratingStars.value = 2
        currentArray = one as NSArray

        updateData()

        Entidades.sharedInstance.subscribe(observer: self)


        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "title")
        imageView.image = image
        navigationItem.titleView = imageView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func ratingChanged(_ sender: AnyObject) {
        try! Entidades.sharedInstance.realm.write {
            cardapioAtual.nota = Int(ratingStars.value)
        }
    }

    func updateData() {
        let index = segmentedControl.selectedSegmentIndex
        let predicate = NSPredicate(format: "dia == %@ AND refeicao == %@",currentDate as NSObject, index  as NSObject)
        let cardapios = Entidades.sharedInstance.realm.objects(Cardapio.self).filter(predicate)
        if (cardapios.isEmpty) {
            cardapioAtual = Cardapio()
        } else {
            cardapioAtual = cardapios.first!
        }
        ratingStars.value = CGFloat(cardapioAtual.nota)
        self.tableView.reloadData()
    }
    
    @IBAction func segmentedControl(sender: AnyObject) {
        updateData()
    }
    
    @IBAction func previousDay(sender: AnyObject) {
        
        currentDate = NSCalendar.current.date(byAdding: .day, value: -1, to: currentDate)
        self.weekday.text = dayFormatter.string(from: currentDate)
        updateData()
    }
    

    @IBAction func nextDay(sender: AnyObject) {

        currentDate = NSCalendar.current.date(byAdding: .day, value: 1, to: currentDate)
        self.weekday.text = dayFormatter.string(from: currentDate)
        updateData()

    }
    
    //MARK: - TableView DataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardapioAtual.comidas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let image = cell.viewWithTag(1) as! UIImageView
        let heart = cell.viewWithTag(2) as! UIImageView
        let name = cell.viewWithTag(3) as! UILabel
        let kcal = cell.viewWithTag(4) as! UILabel

        name.text = cardapioAtual.comidas[indexPath.row].nome
        kcal.text = String(cardapioAtual.comidas[indexPath.row].calorias) + "Kcal"

        if (cardapioAtual.comidas[indexPath.row].preferido) {
            heart.image = #imageLiteral(resourceName: "Hearts Filled-100")
        } else {
            heart.image = #imageLiteral(resourceName: "Hearts-100")
        }

        if indexPath.row % 2 == 0 {
            image.image = UIImage(named: "folha")
        } else {
            image.image = UIImage(named: "frango")
        }

        return cell
    }

}

extension ViewController:EntidadesProtocol {
    func updated() {
        updateData()
    }
}

