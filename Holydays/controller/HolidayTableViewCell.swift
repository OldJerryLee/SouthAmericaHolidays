//
//  HolidayTableViewCell.swift
//  Holydays
//
//  Created by Fabricio Pujol on 26/07/19.
//  Copyright © 2019 Fabricio Pujol. All rights reserved.
//

import UIKit

class HolidayTableViewCell: UITableViewCell {
    
    @IBOutlet var holidayNameLabel: UILabel!
    @IBOutlet var holidayDateLabel: UILabel!
    @IBOutlet var holidayDescriptionLabel: UILabel!
    @IBOutlet var descriptionTitleLabel: UILabel!
    
    func setHoliday(holiday: HolidayDetail){
        holidayNameLabel.text = holiday.name
        holidayDateLabel.text = holiday.date.iso
        
        if let holidayDesciption = holiday.description, !holidayDesciption.isEmpty {
            holidayDescriptionLabel.text = holidayDesciption
        } else {
            holidayDescriptionLabel.text = "Not Available"
        }
        
    }
}
