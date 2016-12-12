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
    private let goalID = Expression<Int64> ("goalID")
    private let names = Expression<String> ("Name")
    private let goalTarget = Expression<Int> ("goalTarget")
    private let progress = Expression<Int> ("Progress")
    private let units = Expression<String> ("Units")
    private let date = Expression<Date> ("Date")
    
    init(){
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        do {
            db = try Connection("\(path)/Goals.sqlite")
            
            // try db?.run("DROP TABLE Goals")
            
            createTable()
        } catch {
            print("Goals: Unable to open the database")
        }
    }
    
    //creates the database table
    func createTable(){
        do {
            try db!.run(Goals.create { table in
                table.column(goalID, primaryKey: true)
                table.column(names)
                table.column(goalTarget)
                table.column(progress)
                table.column(units)
                table.column(date)
            })
        } catch {
            print("Goals: Unable to create table")
        }
    }
    
    //adds a goal into the database
    func add(Goal: Goal)-> Int?{
        do {
            let insert = Goals.insert(
                
                names <- Goal.goalTitle,
                goalTarget <- Goal.goalTarget,
                progress <- Goal.progress,
                units <- Goal.unit,
                date <- Goal.date )
            
            let goalID = try db!.run(insert)
            return Int(goalID)
            
            
        } catch {
            print("Goals: Insert failed")
            return nil
        }
    }
    
    //updates the progress of a goal
    func updateGoal(aID:Int64, aprogress:Int)-> Bool{
        let goal =  Goals.filter(goalID == aID)
        
        do{
            let update = goal.update([
                progress <- aprogress+progress
                ])
            if try db!.run(update) > 0{
                return true
            }
        }catch{
            print("Update failed: \(error)")
        }
        return false
    }
    
    //Updates the experation date of a goal
    func updateDate(aID:Int64)-> Bool{
        let goal =  Goals.filter(goalID == aID)
        
        do{
            let dateNow = Date()
            let update = goal.update([
                date <- dateNow.addingTimeInterval(7*24*60*60)
                ])
            if try db!.run(update) > 0{
                return true
            }
        }catch{
            print("Update failed: \(error)")
        }
        return false
    }

    //deletes a goal from the database
    func deleteGoal(aID: Int64){
        do {
            let goal = Goals.filter(goalID == aID)
            let _ = try db!.run(goal.delete())
        } catch {
            print("GOAL: Delete failed")
        }
    }
    
    //gets all of the goals from the database and then updates the date and progress if past exeperation date
    func getGoals() -> [Goal]{
        var goals: [Goal] = []
        do{
            let dateNow = Date()
            for goal in try db!.prepare(self.Goals){
                goals.append(
                    Goal(goalTitle: goal[names],
                         unit: goal[units],
                         goalTarget: goal[goalTarget],
                         goalID: Int(goal[goalID]),
                         progress: goal[progress],
                         date: goal[date] ))
            }
            for goal in goals{
                if dateNow >= goal.date{
                    updateGoal(aID: Int64(goal.goalID), aprogress: -goal.progress)
                    updateDate(aID: Int64(goal.goalID))
                    
                }
            }
        } catch {
            print("GOAL: unable to read the table")
        }
        
        return goals
    }
}
