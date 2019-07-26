//
//  CountryListaViewController.swift
//  Holydays
//
//  Created by Fabricio Pujol on 25/07/19.
//  Copyright © 2019 Fabricio Pujol. All rights reserved.
//

import UIKit

class CountryListaViewController: UIViewController {
    
    var countries: [Country] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        countries = createArray()
        //self.navigationItem.title = "Choose a country"
        self.title = "Countries"
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "CountryToHoliday" {
            let destination = segue.destination as! HolyTableViewController
            
            destination.countryCode = sender as? String
        }
    }
}

extension CountryListaViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let country = countries[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryTableViewCell
        cell.setCountry(country: country)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contryCode = countries[indexPath.row].code
        performSegue(withIdentifier: "CountryToHoliday", sender: contryCode)
    }
}
