//
//  DateTests.swift
//  Calendar
//
//  Created by Christian Otkjær on 09/12/16.
//  Copyright © 2016 Silverback IT. All rights reserved.
//

import XCTest
@testable import Calendar


class DateTests: XCTestCase
{
    let gregorian =  Calendar(identifier: .gregorian)

    func test_count()
    {
        let date1 = gregorian.date(from: DateComponents(year: 2015, month:  6, day: 14, hour: 22, minute: 39))!
        let date2 = gregorian.date(from: DateComponents(year: 2016, month:  9, day: 25, hour: 22, minute: 39))!
        
        XCTAssertEqual(date2.years(since: date1), 1)
        XCTAssertEqual(date2.months(since: date1), 15)
        XCTAssertEqual(date2.weeks(since: date1), 67)
        XCTAssertEqual(date2.days(since: date1), 469)
        
        let date3 = gregorian.date(from: DateComponents(year: 2016, month: 10, day:  9, hour: 12, minute: 38))!
        let date4 = gregorian.date(from: DateComponents(year: 2016, month: 10, day: 10, hour: 15, minute: 36))!

        XCTAssertEqual(date4.years(since: date3), 0)
        XCTAssertEqual(date4.months(since: date3), 0)
        XCTAssertEqual(date4.weeks(since: date3), 0)
        XCTAssertEqual(date4.hours(since: date3), 26)
        XCTAssertEqual(date4.seconds(since: date3), 97080)
        XCTAssertEqual(date4.seconds(since: date3) * 1000, date4.milliseconds(since: date3))
    }
    
}
