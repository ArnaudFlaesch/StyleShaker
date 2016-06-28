//
//  ProductListController.swift
//  StyleShaker
//
//  Created by Arnaud on 12/06/16.
//  Copyright © 2016 esgi. All rights reserved.
//

import UIKit

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
    }
}