//
//  DetailProductController.swift
//  StyleShaker
//
//  Created by Arnaud on 12/06/16.
//  Copyright © 2016 esgi. All rights reserved.
//

import UIKit

class DetailProductController: UIViewController {
    
    var product : Product?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageComponent: UIImageView!
    @IBOutlet weak var textAreaComponent: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = NSURL(string: product!.picture) {
            if let data = NSData(contentsOfURL: url) {
                imageComponent.image = UIImage(data: data)
            }        
        }
        
        titleLabel.text = product!.title
        textAreaComponent.text = product!.about
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if "fromDetailToWebView" == segue.identifier {
            let controller : ShoppingListController = segue.destinationViewController as! ShoppingListController
            
            controller.productTitle = (product?.title)!
        }
        
    }
    @IBAction func fromDetailToAbout(sender: AnyObject) {
        self.performSegueWithIdentifier("detailToAbout", sender: self)
    }
    
    @IBAction func fromDetailToWebview(sender: AnyObject) {
        self.performSegueWithIdentifier("fromDetailToWebView", sender: self)
    }
}
