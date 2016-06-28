//
//  ProductListController.swift
//  StyleShaker
//
//  Created by Arnaud on 12/06/16.
//  Copyright © 2016 esgi. All rights reserved.
//

import UIKit

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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableview Datasource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count;
    }
    
    /*func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: PostTableViewCell = tableView.dequeueReusableCellWithIdentifier("PostCell") as! PostTableViewCell
        let post: Post = self.posts[indexPath.row];
        
        cell.lblId.text = "\(post.id)"
        cell.lblTitle.text = post.title
        
        return cell
    }*/
    
    // MARK: - UITableview Delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //self.performSegueWithIdentifier("ToDetail", sender: self.posts[indexPath.row]);
    }}

