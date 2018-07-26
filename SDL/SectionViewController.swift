//
//  SectionViewController.swift
//  SomeDayList
//
//  Created by Tirath on 2018-04-01.
//  Copyright © 2018 Tirath. All rights reserved.
//

import UIKit
import CoreData



class SectionViewController: UIViewController {
    var segueData:String?
    var section:[String] = ["Today","Tommorow", "Upcoming"]
    var tasks:[NSManagedObject] = []
    @IBOutlet weak var tableView: UITableView!
    var factory:TaskFactory?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let fetchRequest: NSFetchRequest<Tasks> = Tasks.fetchRequest()
        do {
            tasks = try PersistenceData.context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        factory = TaskFactory(data:tasks)
      
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
// MARK: - UITableViewDataSource
extension SectionViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //let indexPath = tableView.indexPathForSelectedRow //optional, to get from any UIButton for example
        
        let currentCell = tableView.cellForRow(at: indexPath as IndexPath) as! UITableViewCell
        
        segueData =  currentCell.textLabel!.text
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        if(section==0){
            return (factory?.today.count)!
        }
        else if(section==1){
            return (factory?.tommorow.count)!
        }
        else{
            return (factory?.upcoming.count)!
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "To-Do-List" {
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let val:String
               
                if indexPath.section == 0 {
                    val = (factory?.today[indexPath.row])!
                }
                    
                else if indexPath.section == 1 {
                    val = (factory?.tommorow[indexPath.row])!
                }
                
                else{
                    val = (factory?.upcoming[indexPath.row])!
                }
                let controller = segue.destination as! ToDoViewController
                controller.title = val;
                controller.currentCell = val
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
           
           
             let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            
            if(indexPath.section==0){
                cell.textLabel?.text = factory?.today[indexPath.row]
            }
            else if(indexPath.section==1){
    
               cell.textLabel?.text = factory?.tommorow[indexPath.row]
            }
            else{
                cell.textLabel?.text = factory?.upcoming[indexPath.row]
            }
            
            return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return self.section[section]
    }
    
}
