//
//  MidnightsTests.swift
//  Calendar
//
//  Created by Christian Otkjær on 03/01/17.
//  Copyright © 2017 Silverback IT. All rights reserved.
//

import XCTest
@testable import Calendar


class MidnightsTests: XCTestCase
{
    func test_midnights()
    {
        let gregorian = Calendar(identifier: .gregorian)
        
        let date1 = gregorian.date(from: DateComponents(year: 2016, month: 2, day: 14, hour: 12, minute: 39))!
        let date2 = gregorian.date(from: DateComponents(year: 2016, month: 3, day: 1, hour: 0, minute: 2))!
        
        // 16 due to leap day
        XCTAssertEqual(gregorian.midnights(from: date1,  until: date2), 16)
        
        let date3 = gregorian.date(from: DateComponents(year: 2016, month: 12, day: 24, hour: 23, minute: 59, second: 59))!
        let date4 = gregorian.date(from: DateComponents(year: 2016, month: 12, day: 25, hour: 0, minute: 0, second: 0))!
        
        
        XCTAssertEqual(gregorian.midnights(from: date3,  until: date4), 1)
        
        let date5 = gregorian.date(from: DateComponents(year: 2016, month: 12, day: 24, hour: 0, minute: 0, second: 0))!
        
        XCTAssertEqual(gregorian.midnights(from: date5,  until: date4), 1)
    }
}
