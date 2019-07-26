//
//  CountryTableViewCell.swift
//  Holydays
//
//  Created by Fabricio Pujol on 25/07/19.
//  Copyright © 2019 Fabricio Pujol. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet var countryImage: UIImageView!
    @IBOutlet var cointryName: UILabel!
    
    func setCountry(country: Country){
        countryImage.image = country.image
        cointryName.text = country.name
    }
}
