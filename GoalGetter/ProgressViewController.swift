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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        goalsDB.updateGoal(String: goalName.text, Int: Int(Progress))
    }

    }
