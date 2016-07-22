//
//  ProductListController.swift
//  StyleShaker
//
//  Created by Arnaud on 12/06/16.
//  Copyright © 2016 esgi. All rights reserved.
//

import UIKit


let API_ENDPOINT: NSURL = NSURL(string: "http://163.172.27.134/api/products")!

class ProductListController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var products: [Product] = []
    
    var party : Bool = false
    var weekend : Bool = false
    var chill : Bool = false
    var work : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(party)
        print(weekend)
        print(chill)
        print(work)
        self.tableView.registerNib(UINib(nibName: "ProductTableViewCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "ProductCell")
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        parseJsonData();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableview Datasource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products.count;
    }
 
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : ProductTableViewCell = tableView.dequeueReusableCellWithIdentifier("ProductCell") as! ProductTableViewCell
        let product: Product = self.products[indexPath.row];
 
        if let url = NSURL(string: product.thumbnail) {
            if let data = NSData(contentsOfURL: url) {
                cell.imageProduct.image = UIImage(data: data)
            }
        }
        cell.titleProduct.text = product.title
        
        return cell
    }
 
    // MARK: - UITableview Delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("detailProductView", sender: self.products[indexPath.row]);
    }
    
    @IBAction func goToAbout(sender: AnyObject) {
        self.performSegueWithIdentifier("aboutView", sender: self);
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "detailProductView") {
            let controller: DetailProductController = segue.destinationViewController as! DetailProductController
            controller.product = sender as? Product
        }
        
    }
    
    func parseJsonData() {
        let task = NSURLSession.sharedSession().dataTaskWithURL(API_ENDPOINT) { (data, response, error) in
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                
                
                for item in json as! [[String: AnyObject]] {
                    
                    let post: Product = Product(fromId: item["id"] as! String,
                                                fromTitle: item["title"] as! String,
                                                fromPicture: item["picture"] as! String,
                                                fromAbout: item["about"] as! String,
                                                fromThumbnail: item["thumbnail"] as! String,
                        fromTags: item["tags"] as! [String],
                        fromMood: item["criteria"]!["mood"] as![String : Bool],
                        fromGender: item["criteria"]!["gender"] as![String : Bool],
                        fromHair: item["criteria"]!["hair"] as![String : Bool],
                        fromSkin: item["criteria"]!["skin"] as![String : Bool])
                    
                    self.products.append(post);
                }
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.tableView.reloadData()
                })
                
            }
            catch {
                print("Error during serialization");
            }
        }
        
        task.resume()
    }
}