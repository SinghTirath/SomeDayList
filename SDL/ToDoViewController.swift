//
//  ToDoViewController.swift
//  SomeDayList
//
//  Created by Tirath on 2018-04-01.
//  Copyright © 2018 Tirath. All rights reserved.
//
import CoreData
import UIKit

class ToDoViewController: UIViewController {
    var currentCell:String?
    var tasks:[NSManagedObject] = []
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var note: UILabel!
    @IBOutlet weak var date: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(currentCell ?? "Nil")
        
        
        let fetchRequest: NSFetchRequest<Tasks> = Tasks.fetchRequest()
        do {
            tasks = try PersistenceData.context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        var tempDate:String?
        var tempName:String?
        var tempNote:String?
        for object in tasks{
            
            tempDate = (object.value(forKey: "date") as? String)!
            tempName = (object.value(forKey: "name") as? String)!
            //tempNote = (object.value(forKey: "note") as? String)!
            
            if(tempDate==currentCell){
                title  = tempName
                name.text = tempName;
                note.text = tempNote;
                date.text = tempDate;
            }
           
            
        }
        
        
    
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
