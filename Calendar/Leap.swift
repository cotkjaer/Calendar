//
//  Leap.swift
//  Calendar
//
//  Created by Christian Otkjær on 02/01/17.
//  Copyright © 2017 Silverback IT. All rights reserved.
//

import Foundation

private let calendar = Calendar(identifier: .gregorian)

// MARK: - Leap

public struct Gregorian
{
    /**
     Checks if the given year is a leap year
     - parameter year: The (optional) year to check
     - returns:  **true** iff `year` is a Gregorian calendar leap year
     */
    public static func isLeapYear(_ year: Int?) -> Bool
    {
        guard let year = year else { return false }
        
        guard year > 0 else { return false }
        
        if year % 400 == 0 { return true }
        
        if year % 100 == 0 { return false }
        
        return year % 4 == 0
    }
    
    /**
     Checks if the given date is in a leap year
     - parameter date: The (optional) date to check
     - returns:  **true** iff `date` is in a Gregorian calendar leap year
     */
    public static func isInLeapYear(_ date: Date?) -> Bool
    {
        guard let date = date else { return false }
        
        let year = calendar.component(.year, from: date)
        
        return isLeapYear(year)
    }
    
    /**
     Checks if the given date is in a leap day
     - parameter date: The (optional) date to check
     - returns:  **true** iff `date` is in a Gregorian calendar leap day (feb 29th)
     */
    public static func isInLeapDay(_ date: Date?) -> Bool
    {
        guard let date = date else { return false }

        let year = calendar.component(.year, from: date)
        
        guard isLeapYear(year) else { return false }
        
        let month = calendar.component(.month, from: date)
        
        guard month == 2 else { return false }
        
        let day = calendar.component(.day, from: date)
        
        return day == 29
    }
}

// MARK: - Date

extension Date
{
    /** **true** iff this date is in a Gregorian calendar leap year */
    var isInLeapYear: Bool { return Gregorian.isInLeapYear(self) }
    
    /** **true** iff this date is in a Gregorian calendar leap day (feb 29th) */
    var isInLeapDay: Bool { return Gregorian.isInLeapDay(self) }
}
