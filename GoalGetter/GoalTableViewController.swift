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
   
   func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let name = GoalName?.text
        let target = GoalTarget?.text
        let targetArray = target?.components(separatedBy: " ")
        let units = targetArray?[1]
        if segue.identifier == "toProgress" {
            let progressController = segue.destination as!ProgressViewController
            progressController.goalName.text = name
            progressController.Units.text = units
        }
    }

}

class GoalTableViewController: UITableViewController {

    
    var goals:[Goal] = GoalsDB.instance.getGoals()
    override func viewDidLoad() {
        super.viewDidLoad()
    
               // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        print(goals.count)
        return goals.count
        
    }


     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GoalTableViewCell", for: indexPath as IndexPath) as! GoalTableViewCell
        print("This is the override function for the table!!!")
        let goal = goals[indexPath.row]
        cell.GoalName?.text = goal.goalTitle
        cell.GoalTarget?.text = String(goal.goalTarget) + " "+goal.unit
        cell.GoalProgress?.text = (String)(goal.progress)
        cell.ProgressBar?.setProgress(Float(goal.progress)/Float(goal.goalTarget),animated: true)
       
        return cell
    }
    
    
}
