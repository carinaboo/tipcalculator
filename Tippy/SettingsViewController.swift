//
//  SettingsViewController.swift
//  Tippy
//
//  Created by Carina Boo on 7/10/16.
//  Copyright © 2016 Carina Boo. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defaultTipPercentageControl: UISegmentedControl!
    
    weak var delegate: SettingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Set background color of navigation bar
        navigationController?.navigationBar.barTintColor = UIColor(red: 243.0/255.0, green: 243.0/255.0, blue: 243.0/255.0, alpha: 1.0)
        navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(red: 109.0/255.0, green: 115.0/255.0, blue: 127.0/255.0, alpha: 1.0)]

        // Set default tip
        if let defaultTipPercentageIndex: Int = defaults.integerForKey(tipPercentageIndexKey) {
            defaultTipPercentageControl.selectedSegmentIndex = defaultTipPercentageIndex
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func setDefaultTipPercentage(sender: AnyObject) {
        let defaultTipPercentageIndex = defaultTipPercentageControl.selectedSegmentIndex
        defaults.setObject(defaultTipPercentageIndex, forKey: tipPercentageIndexKey)
        if (delegate != nil) {
            delegate!.updateDefaultTipPercentage(self)
        }
    }
}

protocol SettingsViewControllerDelegate: class {
    func updateDefaultTipPercentage(sender: SettingsViewController)
}