//
//  ViewController.swift
//  WiseFly
//
//  Created by Mane, Mahesh Dhanaji (external - Project) on 24/07/16.
//  Copyright © 2016 Mane, Mahesh Dhanaji (external - Project). All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if self.childViewControllers.count == 0 {
            
            self.addChildViewController(segue.destinationViewController)
            segue.destinationViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
            self.view.addSubview(segue.destinationViewController.view)
            segue.destinationViewController.didMoveToParentViewController(self)
            
        } else {
            self.swapFromViewController(self.childViewControllers[0], toViewController: segue.destinationViewController)
        }
    }
    
    func swapFromViewController (fromViewController:UIViewController, toViewController:UIViewController) {
        toViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        
        self.addChildViewController(toViewController)
        self.transitionFromViewController(fromViewController, toViewController: toViewController, duration: 0.2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { 
            
            }) { (Bool) in
                fromViewController.removeFromParentViewController()
                toViewController.didMoveToParentViewController(self)
        }
    }
}

