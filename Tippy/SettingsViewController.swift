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
        defaultTipPercentageControl.selectedSegmentIndex = defaultTipPercentageIndex
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func setDefaultTipPercentage(sender: AnyObject) {
        defaultTipPercentageIndex = defaultTipPercentageControl.selectedSegmentIndex
        if (delegate != nil) {
            delegate!.updateDefaultTipPercentage(self)
        }
    }
}

protocol SettingsViewControllerDelegate: class {
    func updateDefaultTipPercentage(sender: SettingsViewController)
}