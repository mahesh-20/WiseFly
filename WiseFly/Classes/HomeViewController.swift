//
//  HomeViewController.swift
//  WiseFly
//
//  Created by Mane, Mahesh Dhanaji (external - Project) on 28/07/16.
//  Copyright © 2016 Mane, Mahesh Dhanaji (external - Project). All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var containerVC : ContainerViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "EmbedContainerViewController" {
            containerVC = segue.destinationViewController as? ContainerViewController
        }
    }
 
    
//     MARK: - Button Actions
    
    @IBAction func bottomBarButtonTapped(sender: UIButton) {
        
        var segue = ""
        switch sender.tag {
        case HomeBottomBar.flightButtonTag.rawValue :
            segue = HomeContainer.flightsSegue.rawValue
            break
            
        case HomeBottomBar.tripsButtonTag.rawValue :
            segue = HomeContainer.tripsSegue.rawValue
            break
            
        default:
            break
            
        }
        
        containerVC?.performSegueWithIdentifier(segue, sender: nil)
        

    }
    
    
    
    
//    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
//    positionAnimation.velocity = @2000;
//    positionAnimation.springBounciness = 20;
//    [positionAnimation setCompletionBlock:^(POPAnimation *animation, BOOL finished) {
//    self.button.userInteractionEnabled = YES;
//    }];
//    [self.button.layer pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
    
}
