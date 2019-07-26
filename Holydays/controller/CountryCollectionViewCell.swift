//
//  CountryCollectionViewCell.swift
//  Holydays
//
//  Created by Fabricio Pujol on 26/07/19.
//  Copyright © 2019 Fabricio Pujol. All rights reserved.
//

import UIKit

class CountryCollectionViewCell: UICollectionViewCell {
    @IBOutlet var contryImage: UIImageView!
    @IBOutlet var countryName: UILabel!
    
    func setCountry(country: Country){
        contryImage.image = country.image
        countryName.text = country.name
    }
}
