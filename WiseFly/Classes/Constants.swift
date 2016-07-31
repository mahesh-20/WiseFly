//
//  Constants.swift
//  WiseFly
//
//  Created by Mane, Mahesh Dhanaji (external - Project) on 28/07/16.
//  Copyright © 2016 Mane, Mahesh Dhanaji (external - Project). All rights reserved.
//

import Foundation

enum HomeBottomBar : Int {
    case flightButtonTag = 100,
    tripsButtonTag,
    mapButtonTag,
    shoppingButtonTag,
    settingButtonTag
}

enum HomeContainer : String {
    case flightsSegue = "ShowFlightsSegue",
    tripsSegue = "ShowTripsSegue"
}
