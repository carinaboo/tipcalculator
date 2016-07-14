//
//  ViewController.swift
//  Tippy
//
//  Created by Carina Boo on 7/10/16.
//  Copyright © 2016 Carina Boo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentageControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipPercentageControl.selectedSegmentIndex = defaultTipPercentageIndex
        billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "ShowSettings") {
            let viewController = segue.destinationViewController as! SettingsViewController
            viewController.delegate = self
        }
    }

    @IBAction func onTap(sender: AnyObject) {
//        view.endEditing(true)
    }

    @IBAction func calculateTip(sender: AnyObject) {
        calculateTip()
    }
    
    func calculateTip() {
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipPercentageControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
    }
}

extension ViewController: SettingsViewControllerDelegate {
    func updateDefaultTipPercentage(sender: SettingsViewController) {
        tipPercentageControl.selectedSegmentIndex = defaultTipPercentageIndex
        calculateTip()
    }
}

