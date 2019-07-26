//
//  Holiday.swift
//  Holydays
//
//  Created by Fabricio Pujol on 24/07/19.
//  Copyright © 2019 Fabricio Pujol. All rights reserved.
//

import Foundation


struct HolidayResponse: Decodable {
    var response: Holidays
}

struct Holidays: Decodable {
    var holidays: [HolidayDetail]
}

struct HolidayDetail: Decodable {
    var name:String
    var description:String?
    var date:DateInfo
}

//holidayDescription

struct DateInfo: Decodable {
    var iso:String
}
