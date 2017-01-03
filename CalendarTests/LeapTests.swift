//
// LeapTests.swift
// Calendar
//
// Created by Christian Otkjær on 02/01/17.
// Copyright © 2017 Silverback IT. All rights reserved.
//

import XCTest
@testable import Calendar

class LeapTests: XCTestCase
{
    let gregorian = Calendar(identifier: .gregorian)
    
    func test_isInLeapYear()
    {
        let nonLeapYear = gregorian.date(from: DateComponents(year: 2015, month: 6, day: 14, hour: 22, minute: 39))
        
        XCTAssertNotNil(nonLeapYear)
        XCTAssertFalse(Gregorian.isInLeapDay(nonLeapYear))
        XCTAssertFalse(Gregorian.isInLeapYear(nonLeapYear))
        
        let leapDay = gregorian.date(from: DateComponents(year: 2016, month: 2, day: 29))
        
        XCTAssertNotNil(leapDay)
        XCTAssertEqual(leapDay?.isInLeapYear, true)
        XCTAssertEqual(leapDay?.isInLeapDay, true)
        
        let midLeapDay = gregorian.date(from: DateComponents(year: 2016, month: 2, day: 29, hour: 12))
        
        XCTAssertNotNil(midLeapDay)
        XCTAssertEqual(midLeapDay?.isInLeapYear, true)
        XCTAssertEqual(midLeapDay?.isInLeapDay, true)
        
        let nonLeapDay = gregorian.date(from: DateComponents(year: 2016, month: 2, day: 26, hour: 12))
        
        XCTAssertNotNil(nonLeapDay)
        XCTAssertEqual(nonLeapDay?.isInLeapYear, true)
        XCTAssertEqual(nonLeapDay?.isInLeapDay, false)
    }
    
    func test_isLeapYear()
    {
        XCTAssertTrue(Gregorian.isLeapYear(2004))
        XCTAssertTrue(Gregorian.isLeapYear(4))
        XCTAssertTrue(Gregorian.isLeapYear(400))
        XCTAssertTrue(Gregorian.isLeapYear(444))
        XCTAssertTrue(Gregorian.isLeapYear(1200))
        
        XCTAssertFalse(Gregorian.isLeapYear(0))
        XCTAssertFalse(Gregorian.isLeapYear(-4))
        XCTAssertFalse(Gregorian.isLeapYear(1969))
        XCTAssertFalse(Gregorian.isLeapYear(1900))
        XCTAssertFalse(Gregorian.isLeapYear(100))
    }
}
