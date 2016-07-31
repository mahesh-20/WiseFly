//
//  FlightScheduleTableCell.swift
//  WiseFly
//
//  Created by Mane, Mahesh Dhanaji (external - Project) on 31/07/16.
//  Copyright © 2016 Mane, Mahesh Dhanaji (external - Project). All rights reserved.
//

import UIKit

class FlightScheduleTableCell: UITableViewCell {

    @IBOutlet weak var flightNameLabel: UILabel!
    @IBOutlet weak var flightCodeLabel: UILabel!
    @IBOutlet weak var flightLogoImageView: UIImageView!
    @IBOutlet weak var airportCodeLabel: UILabel!
    @IBOutlet weak var flyingFromLabel: UILabel!
    @IBOutlet weak var flyingToLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timesDayLabel: UILabel!
    @IBOutlet weak var statusImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
