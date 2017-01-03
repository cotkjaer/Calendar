//
// CalendarTests.swift
// CalendarTests
//
// Created by Christian Otkjær on 09/12/16.
// Copyright © 2016 Silverback IT. All rights reserved.
//

import XCTest
@testable import Calendar

class CalendarTests: XCTestCase {
    
    let cal = Calendar.current
    
    func test_start_of()
    {
        let now = Date()
        
        var optionalNow : Date? = Date()
        
        XCTAssertLessThan(cal.start(of: .day, for: now), now)
        
        XCTAssertEqual(cal.start(of: .day, for: now), Calendar.current.startOfDay(for: now))
        
        let optional = cal.start(of: .day, for: optionalNow)
        
        XCTAssertNotNil(optional)
        
        XCTAssertLessThan(optional!, now)
        
        optionalNow = nil
        
        XCTAssertNil(optionalNow?.start(of: .hour))
        XCTAssertNil(cal.start(of: .hour, for: optionalNow))
    }
}
