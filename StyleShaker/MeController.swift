//
//  MeController.swift
//  StyleShaker
//
//  Created by Arnaud on 12/06/16.
//  Copyright © 2016 esgi. All rights reserved.
//

import UIKit

class MeController: UIViewController {

    @IBOutlet weak var hairSwitch: UISwitch!
    @IBOutlet weak var skinSwitch: UISwitch!
    @IBOutlet weak var sexSwitch: UISwitch!
    
    @IBOutlet weak var lightHair: UIButton!
    @IBOutlet weak var darkHair: UIButton!
    
    @IBOutlet weak var lightSkin: UIButton!
    @IBOutlet weak var darkSkin: UIButton!
    
    @IBOutlet weak var maleSex: UIButton!
    @IBOutlet weak var femaleSex: UIButton!
    
    var skin :[String : Bool] = [
        "dark" : false,
        "bright" : false
    ]
    
    var hair :[String : Bool] = [
        "dark" : false,
        "bright" : false
    ]
    
    var gender : [String : Bool] = [
        "female" : false,
        "male" : false
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (hairSwitch.on) {
            if(lightHair.selected) {
                hair["bright"] = true
                hair["dark"] = false
            }
            else if (darkHair.selected) {
                hair["bright"] = false
                hair["dark"] = true
            }
        }
        if (skinSwitch.on) {
            if(lightSkin.selected) {
                skin["light"] = true
                skin["dark"] = false
            }
            else if (darkSkin.selected) {
                skin["bright"] = false
                skin["dark"] = true
            }
        }
        if (sexSwitch.on) {
            if(maleSex.selected) {
                gender["male"] = true
                gender["female"] = false
            }
            else if (femaleSex.selected) {
                gender["male"] = false
                gender["female"] = true
            }
        }
        /*
        let controller: ViewController = segue.destinationViewController as! ViewController
        
        controller.view.backgroundColor = button.backgroundColor
         */
    }
    
    @IBAction func selectButton(sender: AnyObject) {
        let button = sender as! UIButton
        button.selected = true
        button.setTitleColor(UIColor.blueColor(), forState: UIControlState.Selected)
        if (button.tag == 1) {
            darkHair.selected = false;
        }
        if (button.tag == 2) {
            lightHair.selected = false;
        }
        if (button.tag == 3) {
            darkSkin.selected = false;
        }
        if (button.tag == 4) {
            lightSkin.selected = false;
        }
        if (button.tag == 5) {
            femaleSex.selected = false;
        }
        if (button.tag == 6) {
            maleSex.selected = false;
        }
    }
}

