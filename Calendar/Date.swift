//
//  Date+Floor.swift
//  Calendar
//
//  Created by Christian Otkjær on 09/12/16.
//  Copyright © 2016 Silverback IT. All rights reserved.
//

import Foundation

extension Date
{
    public func start(of component: Calendar.Component, calendar: Calendar = Calendar.current) -> Date
        
    {
        return calendar.start(of: component, for: self)
    }
    
    public func next(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Date
        
    {
        return calendar.next(component, for: self)
    }
}

//MARK: - Components

extension Date
{
    public func component(_ component: Calendar.Component, inCalendar calendar: Calendar = Calendar.current) -> Int
        
    {
        return calendar.component(component, from: self)
    }
    
    //MARK: - weekday
    
    public func weekday(_ calendar: Calendar = Calendar.current) -> Int
        
    {
        return component(.weekday, inCalendar:  calendar)
    }
}

//MARK: - Seconds

extension Date
{
    /// Whole seconds since reference date
    public var secondsSinceReferenceDate : Int
    {
        return Int(floor(timeIntervalSinceReferenceDate))
    }

    public var millisecondsSinceReferenceDate : Int
    {
        return Int(floor(timeIntervalSinceReferenceDate * 1000))
    }
    
    public func millisecondsSince(date: Date) -> Int
    {
        return Int(floor(timeIntervalSince(date) * 1000))
    }

    public func secondsSince(date: Date) -> Int
    {
        return Int(floor(timeIntervalSince(date)))
    }

    public func millisecondsSince(date: Date) -> Double
    {
        return floor(timeIntervalSince(date) * 1000)
    }
    
    public func secondsSince(date: Date) -> Double
    {
        return floor(timeIntervalSince(date))
    }

}



public extension Date
{
    /**
     Counts the "distance" to `date` measured in fully elapsed `component`s
     
     - parameter component: the units to count
     - parameter date: the date to compare to
     - parameter calendar: the calendar to use, defaults to `Calendar.current`
     
     - returns: the count of fully elapsed `component`s since `date`
     - note: If `date` is later than `self` the result might be negative
     */
    func count(_ component: Calendar.Component, since date: Date, inCalendar calendar: Calendar = Calendar.current) -> Int
    {
        return calendar.dateComponents([component], from: date, to: self).value(for: component) ?? 0
    }
    
    /**
     Counts the number of elapsed full years since `date`
     - parameter date: the date to compare to
     - parameter calendar: the calendar to use
     - returns: the number of fully elapsed years since `date`
     - note: If `date` is later than `self` the result might be negative
     */
    func years(since date: Date, inCalendar calendar: Calendar = Calendar.current) -> Int
    {
        return count(.year, since: date, inCalendar: calendar)
    }
    
    /**
     Counts the number of elapsed full months since `date`
     - parameter date: the date to compare to
     - parameter calendar: the calendar to use
     - returns: the number of fully elapsed months since `date`
     - note: If `date` is later than `self` the result might be negative
     */
    func months(since date: Date, inCalendar calendar: Calendar = Calendar.current) -> Int
    {
        return count(.month, since: date, inCalendar: calendar)
    }
    
    /**
     Counts the number of elapsed full weeks since `date`
     - parameter date: the date to compare to
     - parameter calendar: the calendar to use
     - returns: the number of fully elapsed weeks since `date`
     - note: If `date` is later than `self` the result might be negative
     */
    func weeks(since date: Date, inCalendar calendar: Calendar = Calendar.current) -> Int
    {
        return count(.weekOfYear, since: date, inCalendar: calendar)
    }
    
    /**
     Counts the number of elapsed full days since `date`
     - parameter date: the date to compare to
     - parameter calendar: the calendar to use
     - returns: the number of fully elapsed days since `date`
     - note: If `date` is later than `self` the result might be negative
     */
    func days(since date: Date, inCalendar calendar: Calendar = Calendar.current) -> Int
    {
        return count(.day, since: date, inCalendar: calendar)
    }
    
    /**
     Counts the number of elapsed full hours since `date`
     - parameter date: the date to compare to
     - parameter calendar: the calendar to use
     - returns: the number of fully elapsed hours since `date`
     - note: If `date` is later than `self` the result might be negative
     */
    func hours(since date: Date, inCalendar calendar: Calendar = Calendar.current) -> Int
    {
        return count(.hour, since: date, inCalendar: calendar)
    }
    
    /**
     Counts the number of elapsed full minutes since `date`
     - parameter date: the date to compare to
     - parameter calendar: the calendar to use
     - returns: the number of fully elapsed minutes since `date`
     - note: If `date` is later than `self` the result might be negative
     */
    func minutes(since date: Date, inCalendar calendar: Calendar = Calendar.current) -> Int
    {
        return count(.minute, since: date, inCalendar: calendar)
    }
    
    /**
     Counts the number of elapsed full seconds since `date`
     - parameter date: the date to compare to
     - parameter calendar: the calendar to use
     - returns: the number of fully elapsed seconds since `date`
     - note: If `date` is later than `self` the result might be negative
     */
    func seconds(since date: Date, inCalendar calendar: Calendar = Calendar.current) -> Int
    {
        return count(.second, since: date, inCalendar: calendar)
    }
    
    /**
     Counts the number of elapsed full milliseconds since `date`
     - parameter date: the date to compare to
     - parameter calendar: the calendar to use
     - returns: the number of fully elapsed milliseconds since `date`
     - note: If `date` is later than `self` the result might be negative
     */
    func milliseconds(since date: Date, inCalendar calendar: Calendar = Calendar.current) -> Int
    {
        return Int(floor(timeIntervalSince(date) * 1000))
    }

    /**
     Counts the number of elapsed full nanoseconds since `date`
     - parameter date: the date to compare to
     - parameter calendar: the calendar to use
     - returns: the number of fully elapsed nanoseconds since `date`
     - note: If `date` is later than `self` the result might be negative
     */
    func nanoseconds(since date: Date, inCalendar calendar: Calendar = Calendar.current) -> Int
    {
        return count(.nanosecond, since: date, inCalendar: calendar)
    }
}
