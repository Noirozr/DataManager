//
//  ViewController.swift
//  DataManager
//
//  Created by Noirozr on 15/6/12.
//  Copyright (c) 2015年 Yongjia Liu. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextField!
    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func saveData(sender: AnyObject) {
        
        let entity = NSEntityDescription.entityForName("Code", inManagedObjectContext: managedContext)
        let newCode = Code(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        newCode.year = yearTextField.text
        newCode.month = monthTextField.text
        newCode.day = dayTextField.text
        newCode.content = contentTextField.text
        
        var error: NSError?
        if !managedContext.save(&error) {
            println("fuck?!")
        }
        
    }
    @IBAction func loadData(sender: AnyObject) {
        
        let request = NSFetchRequest()
        var tagEntity = NSEntityDescription.entityForName("Code", inManagedObjectContext: managedContext)
        request.entity = tagEntity
        request.predicate = NSPredicate(format: "year = 2015")
        var error: NSError?
        
        var array = managedContext.executeFetchRequest(request, error: &error)
        if let data = array as? [NSManagedObject] {
            yearLabel.text = data[0].valueForKey("year") as? String
            monthLabel.text = data[0].valueForKey("month") as? String
            dayLabel.text = data[0].valueForKey("day") as? String
            contentLabel.text = data[0].valueForKey("content") as? String
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

