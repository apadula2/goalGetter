//
//  GoalsDB.swift
//  GoalGetter
//
//  Created by Sean Webber on 11/16/16.
//  Copyright © 2016 Sean Webber. All rights reserved.
//

import SQLite


class GoalsDB{
    
    //singleton pattern
    static let instance = GoalsDB()
    
    private var db: Connection? = nil
    
    private let Goals = Table("Goals")
    private let goalID = Expression<Int> ("goalID")
    private let names = Expression<String> ("Name")
    private let goalTarget = Expression<Int> ("goalTarget")
    private let progress = Expression<Int> ("Progress")
    private let units = Expression<String> ("Units")
    
    
     init(){
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        do {
            db = try Connection("\(path)/Goals.sqlite")
            createTable()
        } catch {
            print("Goals: Unable to open the database")
        }
    }
    func createTable(){
        do {
            try db!.run(Goals.create { table in
                table.column(goalID, primaryKey: true)
                table.column(names)
                table.column(goalTarget)
                table.column(progress)
                table.column(units)
            })
        } catch {
            print("Goals: Unable to create table")
        }
    }
    
    func add(Goal: Goal)-> Int?{
        do {
            let insert = Goals.insert(
                
                names <- Goal.goalTitle,
                goalTarget <- Goal.goalTarget,
                progress <- Goal.progress,
                units <- Goal.unit)
            
          let goalID = try db!.run(insert)
          return Int(goalID)

        } catch {
            print("Goals: Insert failed")
            return nil
        }
    }
    
    func deleteGoal(aId: Int){
        do {
            let goal = Goals.filter(goalID == aId)
            let _ = try db!.run(goal.delete())
        } catch {
            print("GOAL: Delete failed")
        }
    }
    func getGoals() -> [Goal]{
        var goals: [Goal] = []
        do{
            for goal in try db!.prepare(self.Goals){
            goals.append(
                Goal(goalTitle: goal[names],
                     unit: goal[units],
                     goalTarget: goal[goalTarget],
                     goalID: goal[goalID],
                     progress: goal[progress]))
            }
        } catch {
            print("GOAL: unable to read the table")
        }
        
        return goals
    }
}
