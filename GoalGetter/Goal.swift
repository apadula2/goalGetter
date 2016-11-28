//
//  Goal.swift
//  GoalGetter
//
//  Created by Sean Webber on 11/16/16.
//  Copyright © 2016 Sean Webber. All rights reserved.
//

import Foundation


class Goal{
    
    var goalTitles: [String] = []
    var units: [String] = []
    var goalNumbers: [Int] = []
    
    init(){
        
    }
    
    func addGoal(name: String, unit: String, goalNumber: Int){
        goalTitles.append(name)
        units.append(unit)
        goalNumbers.append(goalNumber)
    }
    
    func deleteGoal(name: String, unit: String, goalNumber: Int){
        
        let index =  goalTitles.index(of: name)
        goalTitles.remove(at: index!)
        
        let index1 = units.index(of: unit)
        units.remove(at: index1!)
        
        let index2 = goalNumbers.index(of: goalNumber)
        goalNumbers.remove(at: index2!)
    }
    
    func updateProgressBar
    
    
}
