//
//  ListGoalsViewController.swift
//  GoalGetter
//
//  Created by Alexis Padula on 11/16/16.
//  Copyright © 2016 Alexis Padula. All rights reserved.
//

import UIKit

class ListGoalsViewController: UITableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return //array of goals
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        cell.textLabel?.text = //goal title in list
        
        return cell
    }
    
    
}

