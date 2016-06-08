//
//  ViewController.swift
//  StyleShaker
//
//  Created by Etudiant on 07/06/2016.
//  Copyright (c) 2016 esgi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var selectHair: UISwitch!
    @IBOutlet weak var selectSkin: UISwitch!
    @IBOutlet weak var selectSex: UISwitch!
    
    @IBOutlet weak var lightHair: UILabel!
    @IBOutlet weak var darkHair: UILabel!
    
    @IBOutlet weak var lightSkin: UILabel!
    @IBOutlet weak var darkSkin: UILabel!
    
    @IBOutlet weak var maleSex: UILabel!
    @IBOutlet weak var femaleSex: UILabel!

    @IBAction func validate(sender: AnyObject) {
        self.performSegueWithIdentifier("toDetail", sender: self);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

