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
}
