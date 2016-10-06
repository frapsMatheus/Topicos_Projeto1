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
    
    let week = ["23/09 SEXTA-FEIRA", "24/09 - SÁBADO", "25/09 - DOMINGO"]
    
    let one = ["Caçarola marinada (paleta)", "Cuzcuz vegetariano", "Arroz branco, integral, verde", "Molho de salsa"]
    let second = ["Cuzcuz verde", "Salada de Fruta", "Pao de Queijo"]
    let third = []
    
    var currentArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weekday.text = week.first
        ratingStars.value = 2
        currentArray = one
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
        imageView.contentMode = .ScaleAspectFit
        let image = UIImage(named: "title")
        imageView.image = image
        navigationItem.titleView = imageView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentedControl(sender: AnyObject) {
        switch (segmentedControl.selectedSegmentIndex)
        {
        case 0:
            currentArray = one
            self.tableView.reloadData()
            break;
        case 1:
            currentArray = second
            self.tableView.reloadData()
            break;
        default:
            currentArray = []
            self.tableView.reloadData()
            break; 
        }
    }
    
    @IBAction func previousDay(sender: AnyObject) {
        
        var currentPosition = 0
        
        for (index, weekday) in self.week.enumerate() {
            if self.weekday.text == weekday {
                currentPosition = index
                
                if currentPosition > 0 {
                    self.weekday.text = week[--currentPosition]
                    ratingStars.value = CGFloat(currentPosition)
                    break
                }
            }
        }

    }
    

    @IBAction func nextDay(sender: AnyObject) {
        
        var currentPosition = 0
        
        for (index, weekday) in self.week.enumerate() {
            if self.weekday.text == weekday {
                currentPosition = index
                
                if currentPosition < week.count-1 {
                    self.weekday.text = week[++currentPosition]
                    ratingStars.value = CGFloat(++currentPosition)
                    break
                }
            }
        }
        
    }
    
    //MARK: - TableView DataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = currentArray[indexPath.row] as? String
        cell.detailTextLabel?.text = "180kcal"
        
        if indexPath.row % 2 == 0 {
            cell.imageView?.image = UIImage(named: "folha")
        } else {
            cell.imageView?.image = UIImage(named: "frango")
        }
        
        
        
        return cell
    }

}

