//
//  TopFlightDetailContainerController.swift
//  WiseFly
//
//  Created by Mane, Mahesh Dhanaji (external - Project) on 31/07/16.
//  Copyright © 2016 Mane, Mahesh Dhanaji (external - Project). All rights reserved.
//

import UIKit

class TopFlightDetailContainerController: UIViewController {
    @IBOutlet weak var shimmeringView: FBShimmeringView!
    @IBOutlet weak var loadingImageView: UIImageView!
    
    let tweaks = Tweaks()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        

        shimmeringView.shimmeringAnimationOpacity = 0.1
        shimmeringView.shimmeringOpacity = 1.0
        shimmeringView.shimmeringSpeed = 30
        shimmeringView.shimmeringHighlightLength = 0.50
        
        shimmeringView.contentView = loadingImageView
        shimmeringView.shimmering = true
        
        self.addTweaksForShimmeringView()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.shimmeringView.shimmeringAnimationOpacity = CGFloat(Tweaks.tweakValueForCategory("Shimmering View", collectionName: "FBShimmering", name: "Animation Opacity", defaultValue: 0.1).floatValue)
        self.shimmeringView.shimmeringOpacity = CGFloat(Tweaks.tweakValueForCategory("Shimmering View", collectionName: "FBShimmering", name: "Opacity", defaultValue: 1.0).floatValue)
        self.shimmeringView.shimmeringSpeed = CGFloat(Tweaks.tweakValueForCategory("Shimmering View", collectionName: "FBShimmering", name: "Speed", defaultValue: 30.0).floatValue)
        self.shimmeringView.shimmeringHighlightLength = CGFloat(Tweaks.tweakValueForCategory("Shimmering View", collectionName: "FBShimmering", name: "Highlight Length", defaultValue: 0.50).floatValue)
    }
    
    func addTweaksForShimmeringView () {
        tweaks.tweakActionForCategory("Shimmering View", collectionName: "FBShimmering", name: "Animation Opacity", defaultValue: 0.1, minimumValue: 0.1, maximumValue: 1.0, action: { (currentValue) -> () in
            self.shimmeringView.shimmeringAnimationOpacity = CGFloat(currentValue.floatValue)
        })
        
        tweaks.tweakActionForCategory("Shimmering View", collectionName: "FBShimmering", name: "Opacity", defaultValue: 1.0, minimumValue: 0.1, maximumValue: 1.0, action: { (currentValue) -> () in
            self.shimmeringView.shimmeringOpacity = CGFloat(currentValue.floatValue)
        })
        
        tweaks.tweakActionForCategory("Shimmering View", collectionName: "FBShimmering", name: "Speed", defaultValue: 30, minimumValue: 1.0, maximumValue: 230.0, action: { (currentValue) -> () in
            self.shimmeringView.shimmeringSpeed = CGFloat(currentValue.floatValue)
        })
        
        tweaks.tweakActionForCategory("Shimmering View", collectionName: "FBShimmering", name: "Highlight Length", defaultValue: 0.50, minimumValue: 0.0, maximumValue: 1.0, action: { (currentValue) -> () in
            self.shimmeringView.shimmeringHighlightLength = CGFloat(currentValue.floatValue)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func locationButtonTapped(sender: FlatButton) {
        sender.selected = !sender.selected
    }
    
    @IBAction func editButtonTapped(sender: FlatButton) {
        sender.selected = !sender.selected
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
