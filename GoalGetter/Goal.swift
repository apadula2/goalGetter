
// Goal.swift
//  GoalGetter
//
//  Created by Sean Webber on 11/16/16.
//  Copyright © 2016 Sean Webber. All rights reserved.
//

import Foundation


class Goal{
    
    var goalTitle: String
    var unit: String
    var goalTarget: Int
    var goalID: Int
    var progress: Int
    
    init(goalTitle: String, unit: String, goalTarget: Int, goalID: Int, progress: Int){
        self.goalTitle = goalTitle
        self.unit = unit
        self.goalTarget = goalTarget
        self.goalID = goalID
        self.progress = progress
       // let goalsDatabase = GoalsDB()
    }
    
}
