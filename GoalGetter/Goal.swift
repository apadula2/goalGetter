
// Goal.swift
//  GoalGetter
//
//  Created by Sean Webber on 11/16/16.
//  Copyright © 2016 Sean Webber. All rights reserved.
//

import Foundation


class Goal{
    
    var goalTitle: String = ""
    var unit: String = ""
    var goalNumbers: Int = 0
    var goalID: Int = 0
    var additions: Int = 0
    
    init(){
        let goalsDatabase = GoalsDB()
    }
    
    func addGoal(goalID: Int, name: String, unit: String, goalNumber: Int){
        GoalsDB.add(<#T##GoalsDB#>)
    }
    
    func deleteGoal(name: String, unit: String, goalNumber: Int){
        GoalsDB.deleteGoal(<#T##GoalsDB#>)
        
    }
    
    func updateProgressBar
    
    
}
