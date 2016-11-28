//
//  GoalsDB.swift
//  GoalGetter
//
//  Created by Sean Webber on 11/16/16.
//  Copyright © 2016 Sean Webber. All rights reserved.
//

import Foundation
import SQLite

class GoalsDB{
    
    //singleton pattern
    static let instance = GoalsDB()
    
    private var db: Connection? = nil
    
    private let Goals = Table("Goals")
    private let names = <String> ("Name")
    private let goalNumbers = <Int> ("goalNumber")
    private let additions = <Int> ("Addition")
    private let units = <String> ("Units")
}
