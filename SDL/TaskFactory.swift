//
//  TaskFactory.swift
//  SomeDayList
//
//  Created by Tirath on 2018-04-04.
//  Copyright © 2018 Tirath. All rights reserved.
//

import Foundation
import CoreData
class TaskFactory{
    
    var today = [String]()
    var tommorow = [String]()
    var upcoming = [String]()
    
    //var cellData:[[String]] = []
    private var tempDate:String?
    private var tempName:String?
    var data:[NSManagedObject]
    
    init(data:[NSManagedObject]) {
        self.data = data
        initilizeFactory()
    }
    
    
    
    func initilizeFactory(){
        for object in data{
            
            tempDate = (object.value(forKey: "date") as? String)!
            tempName = (object.value(forKey: "name") as? String)!
            if(tempDate==addDaysToDate(i:0)){
                today.append(tempName!)
            }
            else if(tempDate==addDaysToDate(i:1)){
                tommorow.append(tempName!)
            }
            else{
                upcoming.append(tempName!)
            }
            
        }
        
    }
    
    
    func addDaysToDate(i:Int) -> String {
        let monthsToAdd = 0
        let daysToAdd = i
        let yearsToAdd = 0
        let currentDate = Date()
        
        var dateComponent = DateComponents()
        
        dateComponent.month = monthsToAdd
        dateComponent.day = daysToAdd
        dateComponent.year = yearsToAdd
        
        let futureDate = Calendar.current.date(byAdding: dateComponent, to: currentDate)
        
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let myString = formatter.string(from: futureDate!)
        // convert your string to date
        let yourDate = formatter.date(from: myString)
        //then again set the date format whhich type of output you need
        formatter.dateFormat = "dd-MM-yyyy"
        // again convert your date to string
        return formatter.string(from: yourDate!)
    }
    
    
    
}
