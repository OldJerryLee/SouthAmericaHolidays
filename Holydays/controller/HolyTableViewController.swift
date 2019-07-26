//
//  HolyTableViewController.swift
//  Holydays
//
//  Created by Fabricio Pujol on 24/07/19.
//  Copyright © 2019 Fabricio Pujol. All rights reserved.
//

import UIKit

class HolyTableViewController: UITableViewController {

    var countryCode: String?
    
    var listHolidays = [HolidayDetail]() {
        didSet {
            DispatchQueue.main.sync {
                self.tableView.reloadData()
                self.navigationItem.title = "\(self.listHolidays.count) Holidays Found!"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchForHolidays(countryCode: countryCode ?? "")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listHolidays.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let holiday = listHolidays[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "HolidayCell", for: indexPath) as! HolidayTableViewCell
        cell.setHoliday(holiday: holiday)
        
        return cell
    }
    
    func searchForHolidays(countryCode: String){
        let holidayRequest = HolidayRequest(countryCode: countryCode)
        holidayRequest.getHolidays { [weak self] result in
            switch result {
            case.failure(let error):
                print(error)
            case.success(let holidays):
                self?.listHolidays = holidays
            }
            
        }
    }
}

