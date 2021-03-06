//
//  Globals.swift
//  Tippy
//
//  Created by Carina Boo on 7/13/16.
//  Copyright © 2016 Carina Boo. All rights reserved.
//

import Foundation

let tipPercentages = [0.18, 0.20, 0.25]

// MARK: NSUserDefaults and keys
// For persistent global variables across app startups.

// Defaults object used to grab user default values
let defaults = NSUserDefaults.standardUserDefaults()

// Default tip percentage index. Integer.
let tipPercentageIndexKey = "tipPercentageIndex"

// Most recent calculated bill. Shows in app for 10 min, or until new calculation. Double.
let lastBillKey = "recentBill"

// Datetime when the most recent bill was calculated. NSDate.
let lastBillDateKey = "recentBillDate"
