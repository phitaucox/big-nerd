//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Cox, Christian on 5/9/16.
//  Copyright © 2016 Cox, Christian. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: View Life Cycle Stuff
    override func viewDidLoad() {
        // When this method is called, all outlets etc have been loaded.
        // Use this when your custom code only needs to be done once during the run of the app.
        
        // Always call the super implementation of viewDidLoad
        super.viewDidLoad()
        
        let viewLoadString = NSLocalizedString("ConversionViewController loaded its view.", comment: "ConversionVC view did load")
        print(viewLoadString)
    }
    
    override func viewWillAppear(animated: Bool) {
        // When this method is called, all outlets etc have NOT been loaded.
        // Use this when your custom code needs to be done each time the view controller's view appears on screen.
        
        // Always call the super implementation of viewDidLoad
        super.viewDidLoad()
        
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Hour], fromDate: date)
        if components.hour < 18 {
            view.backgroundColor = UIColor.lightGrayColor()
        } else {
            view.backgroundColor = UIColor.darkGrayColor()
        }
    }
    
    
    // MARK: Declarations
    @IBOutlet var celciusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var fahrenheitValue: Double? {
        didSet {
            updateCelciusLabel()
        }
    }
    
    var celciusValue: Double? {
        if let value = fahrenheitValue {
            return (value - 32) * (5/9)
        }
        else {
            return nil
        }
    }
    
    let numberFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    
    // MARK: IB Stuff
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        if let text = textField.text, number = numberFormatter.numberFromString(text) {
            fahrenheitValue = number.doubleValue
        }
        else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }
    
    
    // MARK: Misc funcs
    func updateCelciusLabel() {
        if let value = celciusValue {
            celciusLabel.text = numberFormatter.stringFromNumber(value)
        }
        else {
            celciusLabel.text = "???"
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let currentLocale = NSLocale.currentLocale()
        let decimalSeparator = currentLocale.objectForKey(NSLocaleDecimalSeparator) as! String
        let existingTextHasDecimalSeparator = textField.text?.rangeOfString(decimalSeparator)
        let replacementTextHasDecimalSeparator = string.rangeOfString(decimalSeparator)

        if string.characters.count == 0 {
            return true
        } else {
            if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
                return false
            }
            else {
                return true
            }
        }
    }
}