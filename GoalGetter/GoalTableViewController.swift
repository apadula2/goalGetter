//
//  GoalTableViewController.swift
//  GoalGetter
//
//  Created by Alexis Padula on 11/30/16.
//  Copyright © 2016 Alexis Padula. All rights reserved.
//

import UIKit

class GoalTableViewCell: UITableViewCell{
    @IBOutlet weak var GoalName: UILabel!
    @IBOutlet weak var GoalTarget: UILabel!
    @IBOutlet weak var GoalProgress: UILabel!
    @IBOutlet weak var ProgressBar: UIProgressView!
    
    
}

class GoalTableViewController: UITableViewController {
    var goalsDB = GoalsDB.instance
    
    var goals:[Goal] = []
    
    //Updates the goal array everytimet the view loads
    override func viewDidLoad() {
        super.viewDidLoad()
        goals = GoalsDB.instance.getGoals()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Add a background view to the table view
        let backgroundImage = UIImage(named: "Image")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //number of rows is number of goals
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
        
    }
    
    //allows for swipe delete and deletes from database
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            let goal = goals[indexPath.row]
            GoalsDB.instance.deleteGoal(aID: Int64(goal.goalID) )
            goals.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
    
    //adds row for each goal sets cell attributes depending on the goal name, target,and progress
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! GoalTableViewCell
        let goal = goals[indexPath.row]
        cell.GoalName?.text = goal.goalTitle
        cell.GoalTarget?.text = String(goal.goalTarget) + " "+goal.unit
        cell.GoalProgress?.text = (String)(goal.progress)
        cell.ProgressBar?.setProgress(Float(goal.progress)/Float(goal.goalTarget),animated: true)
        
        return cell
    }
    
    //if going to progress screen, sends the goal name and unit for the next screen to use
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "toProgress" {
            let indexPath = self.tableView.indexPathForSelectedRow
            let goal = goals[(indexPath?.row)!]
            let name = goal.goalTitle
            let units = goal.unit
            let progressController = segue.destination as!ProgressViewController
            progressController.nameText = name
            progressController.unitText = units
        }
    }
    
    
}
