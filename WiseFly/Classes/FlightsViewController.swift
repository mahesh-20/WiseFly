//
//  FlightsViewController.swift
//  WiseFly
//
//  Created by Mane, Mahesh Dhanaji (external - Project) on 28/07/16.
//  Copyright © 2016 Mane, Mahesh Dhanaji (external - Project). All rights reserved.
//

import UIKit

class FlightsViewController: UIViewController {

    var flightScheduleArray : NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        flightScheduleArray = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("FlightScheduleList", ofType: "plist")!)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    // MARK: - Table view delegates
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flightScheduleArray!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FlightScheduleTableCell", forIndexPath: indexPath) as! FlightScheduleTableCell
        
        let row = indexPath.row
        
        let flightScheduleDict: NSDictionary = flightScheduleArray!.objectAtIndex(row) as! NSDictionary
        
        cell.flightNameLabel.text = flightScheduleDict.objectForKey("Name") as? String
        cell.flightCodeLabel.text = flightScheduleDict.objectForKey("Number") as? String
//        cell.flightLogoImageView: UIImageView!
        cell.airportCodeLabel.text = flightScheduleDict.objectForKey("Airport Code") as? String
        cell.flyingFromLabel.text = flightScheduleDict.objectForKey("From") as? String
        cell.flyingToLabel.text = flightScheduleDict.objectForKey("To") as? String
        cell.timeLabel.text = flightScheduleDict.objectForKey("Time") as? String
//        cell.timesDayLabel.text = flightScheduleDict.objectForKey("Name") as? String
//        cell.statusImageView: UIImageView!
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }

}
