//
//  ProgressViewController.swift
//  GoalGetter
//
//  Created by Sean Webber on 12/10/16.
//  Copyright © 2016 Alexis Padula. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController {
    
    @IBOutlet weak var Progress: UITextField!
    @IBOutlet weak var Units: UILabel!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var goalName: UILabel!
    
    var goalsDB:GoalsDB = GoalsDB.instance
    var nameText=""
    var unitText=""
    
    //Goal name and units are set using the the information sent by the main screen in segue
    override func viewDidLoad() {
        super.viewDidLoad()
        goalName.text=nameText
        Units.text=unitText
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //goal is searched for in database and progress inputed is addded to original progrewss of goal and database is updated with new progress
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let goals = GoalsDB.instance.getGoals()
        var goal:Goal? = nil
        for g in goals{
            if g.goalTitle == goalName.text{
                goal = g
            }
        }
        GoalsDB.instance.updateGoal(aID: Int64((goal?.goalID)!), aprogress: Int(Progress.text!)!)
    }
    
}
