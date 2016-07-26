//
//  MyTableViewController.swift
//  TableViewSectionHeader
//
//  Created by Jasper Wang on 7/10/16.
//  Copyright © 2016 Jasper Wang. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController, BannerDelegate {
    
    var items = ["a","b","c"]
    
    var shouldShowHeader = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        (UIApplication.sharedApplication().delegate as! AppDelegate).bannerDelegate = self
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    // MARK: - BannerDelegate
    
    func showBanner(needToShow: Bool) {
        self.shouldShowHeader = needToShow
        let set = NSIndexSet(index: 0)
        self.tableView.beginUpdates()
        self.tableView.deleteSections(set, withRowAnimation: .None)
        self.tableView.insertSections(set, withRowAnimation: .None)
        self.tableView.endUpdates()
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        cell.textLabel?.text = self.items[indexPath.row]
        return cell
    }
    
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if (section == 0 && self.shouldShowHeader){
            let bannerView = UINib(nibName: "BannerView", bundle: nil).instantiateWithOwner(nil, options: nil).first as! BannerView
            return bannerView
        }
        return nil
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        if (section == 0 && self.shouldShowHeader){
            return 20.0
        }
        return 0.0
    }

}
