//
//  AddGoalViewController.swift
//  GoalGetter
//
//  Created by Alexis Padula on 12/7/16.
//  Copyright © 2016 Alexis Padula. All rights reserved.
//

import UIKit

class AddGoalViewController: UIViewController {

    @IBOutlet weak var NameGoalTextField: UITextField!
    @IBOutlet weak var GoalTargetNumber: UITextField!
    @IBOutlet weak var GoalTargetUnits: UITextField!
    @IBOutlet weak var AddGoalButten: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let name = NameGoalTextField.text
        let target = Int(GoalTargetNumber.text!)
        let units = GoalTargetUnits.text
        let now = Date()
        let dueDate = now.addingTimeInterval(7*24*60*60)
        let goal = Goal(goalTitle: name!, unit: units!, goalTarget: target!, goalID: 1, progress: 0, date: dueDate )
        _ = GoalsDB.instance.add(Goal: goal)
    }
}
