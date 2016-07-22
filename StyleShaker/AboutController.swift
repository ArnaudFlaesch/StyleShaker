//
//  AboutController.swift
//  StyleShaker
//
//  Created by Arnaud on 12/06/16.
//  Copyright © 2016 esgi. All rights reserved.
//

import UIKit

class AboutController: UIViewController {
    
    @IBOutlet weak var descriptionFeatures: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionFeatures.text = "Fonctionnalités : Affichage de la liste de produits depuis l'API, du détail d'un produit et recherche sur Google Shooping"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}