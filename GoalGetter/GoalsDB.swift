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
    private let goalNumbers = Expression<Int> ("goalNumber")
    private let total = Expression<Int> ("Total")
    private let units = Expression<String> ("Units")
    
    
    private init(){
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
                table.column(goalNumbers)
                table.column(total)
                table.column(units)
            })
        } catch {
            print("Goals: Unable to create table")
        }
    }
    
    func add(Goal: Goal){
        do {
            let insert = Goal.insert(
                goalID <- Goal.goalID,
                names <- Goal.goalTitle,
                goalNumbers <- Goal.goalNumbers,
                total <- Goal.total,
                units <- Goal.units)
            
            let id = try db!.run(insert)
            return id
        } catch {
            print("Goals: Insert failed")
            return nil
        }
    }
    
    func deleteGoal(goalId: Int){
        do {
            let goal = Goal.filter(id == goalID)
            let _ = try db!.run(Goal.delete())
        } catch {
            print("GOAL: Delete failed")
        }
    }
    
    
    
}
