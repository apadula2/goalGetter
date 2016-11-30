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
     
        return goals.length
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GoalCell", for: indexPath) as! GoalTableViewCell
       
        let goal = goals[indexPath.row]
        cell.GoalName?.text = goal.goalTitle
        cell.GoalTarget?.text = goal.goalTarget + goal.unit
        cell.GoalProgress?.text = goal.progress
        cell.ProgressBar?.setProgress(goal.progress/goal.goaltarget,true)
       
        return cell
    }
}
