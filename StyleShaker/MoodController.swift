//
//  MoodController.swift
//  StyleShaker
//
//  Created by Arnaud on 12/06/16.
//  Copyright © 2016 esgi. All rights reserved.
//

import UIKit

class MoodController: UIViewController {
    
    var hairbright : Bool = false
    var hairDark : Bool = false
    var skinBright : Bool = false
    var skinDark : Bool = false
    var genderMale : Bool = false
    var genderFemale : Bool = false
    
    @IBOutlet weak var workSwitch: UISwitch!
    @IBOutlet weak var soireeSwitch: UISwitch!
    @IBOutlet weak var weekendSwitch: UISwitch!
    @IBOutlet weak var chillSwitch: UISwitch!
    
    
    @IBOutlet weak var moodDescription: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        moodDescription.text = "Sélectionnez un ou plusieurs critères en fonction de votre humeur"
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if "productView" == segue.identifier {
            let controller : ProductListController = segue.destinationViewController as! ProductListController
            
            controller.party = soireeSwitch.on
            controller.work = workSwitch.on
            controller.chill = chillSwitch.on
            controller.weekend = weekendSwitch.on
        }
        
    }
    
    @IBAction func validateStyle(sender: AnyObject) {
        self.performSegueWithIdentifier("productView", sender : self)
    }
    
    @IBAction func moodToAbout(sender: AnyObject) {
        self.performSegueWithIdentifier("fromMoodToAbout", sender : self)    }
    
}
