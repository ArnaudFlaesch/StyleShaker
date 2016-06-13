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
    
    @IBOutlet weak var lightHairLabel: UILabel!
    @IBOutlet weak var darkHairLabel: UILabel!
    
    @IBOutlet weak var lightSkinLabel: UILabel!
    @IBOutlet weak var darkSkinLabel: UILabel!
    
    @IBOutlet weak var maleSexLabel: UILabel!
    @IBOutlet weak var femaleSexLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
}

