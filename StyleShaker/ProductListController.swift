//
//  ProductListController.swift
//  StyleShaker
//
//  Created by Arnaud on 12/06/16.
//  Copyright © 2016 esgi. All rights reserved.
//

import UIKit

<<<<<<< HEAD
class ProductListController: UITableViewController  {

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
        // Do any additional setup after loading the view, typically from a nib.
=======
let API_ENDPOINT: NSURL = NSURL(string: "163.172.27.134/api/products")!

class ProductListController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    @IBOutlet weak var tableView: UITableView!
    var posts: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerNib(UINib(nibName: "PostTableViewCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "PostCell")
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(API_ENDPOINT) { (data, response, error) in
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                for item in json as! [[String: AnyObject]] {
                    
                    let post: Product = Product(id: item["id"] as! String,
                        userId: item["userId"] as! Int,
                        title: item["title"] as! String,
                        body: item["body"] as! String)
                    
                    self.posts.append(post);
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
>>>>>>> 60ab9ea1caf4a4fcbf0293aca7e682d21eaa8cfc
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableview Datasource
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
        //return self.posts.count;
    }
    
    /*func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: PostTableViewCell = tableView.dequeueReusableCellWithIdentifier("PostCell") as! PostTableViewCell
        let post: Post = self.posts[indexPath.row];
        
        cell.lblId.text = "\(post.id)"
        cell.lblTitle.text = post.title
        
        return cell
    }*/
    
    // MARK: - UITableview Deleoverride gate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //self.performSegueWithIdentifier("ToDetail", sender: self.posts[indexPath.row]);
<<<<<<< HEAD
    }
}
=======
    }}

>>>>>>> 60ab9ea1caf4a4fcbf0293aca7e682d21eaa8cfc
