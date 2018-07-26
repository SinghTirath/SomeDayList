//
//  AddTaskViewController.swift
//  SomeDayList
//
//  Created by Tirath on 2018-04-01.
//  Copyright © 2018 Tirath. All rights reserved.
//
import CoreData
import UIKit

class AddTaskViewController: UIViewController {
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var notes: UITextField!
    
    @IBOutlet weak var date: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        title = "New Task"
    }
    
    @IBAction func saveTask(_ sender: Any) {
        var name = self.name.text
        let task = Tasks(context:PersistenceData.context)
        task.name = name
        task.date = dateToString(d:date.date)
        task.note = notes.text
        PersistenceData.saveContext()
    }
    
    func dateToString(d:Date) ->String {
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let myString = formatter.string(from: d)
        // convert your string to date
        let yourDate = formatter.date(from: myString)
        //then again set the date format whhich type of output you need
        formatter.dateFormat = "dd-MM-yyyy"
        // again convert your date to string
        return formatter.string(from: yourDate!)
    }

}

