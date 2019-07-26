//
//  ContriesCollectionViewController.swift
//  Holydays
//
//  Created by Fabricio Pujol on 26/07/19.
//  Copyright © 2019 Fabricio Pujol. All rights reserved.
//

import UIKit

class ContriesCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var countries: [Country] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        countries = createArray()
    }
    
    func createArray() -> [Country] {
        var tempCountries: [Country] = []
        
        let country01 = Country(name: "Argentina", image: #imageLiteral(resourceName: "argentina"), code: "AR")
        let country02 = Country(name: "Brasil", image: #imageLiteral(resourceName: "brasil"), code: "BR")
        let country03 = Country(name: "Chile", image: #imageLiteral(resourceName: "chile"), code: "CL")
        let country04 = Country(name: "Colombia", image: #imageLiteral(resourceName: "colombia"), code: "CO")
        let country05 = Country(name: "Peru", image: #imageLiteral(resourceName: "peru"), code: "PE")
        let country06 = Country(name: "Uruguai", image: #imageLiteral(resourceName: "uruguay"), code: "UY")
        
        tempCountries.append(country01)
        tempCountries.append(country02)
        tempCountries.append(country03)
        tempCountries.append(country04)
        tempCountries.append(country05)
        tempCountries.append(country06)
        
        return tempCountries
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let country = countries[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contriesCollectionCell", for: indexPath) as! CountryCollectionViewCell
        cell.setCountry(country: country)
        
        //creating shadows and make modifications on the cards
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let contryCode = countries[indexPath.row].code
        performSegue(withIdentifier: "CollectionToHoliday", sender: contryCode)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CollectionToHoliday" {
            let destination = segue.destination as! HolyTableViewController
            destination.countryCode = sender as? String
        }
    }
    
}
