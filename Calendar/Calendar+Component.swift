//
//  Calendar+Component.swift
//  Calendar
//
//  Created by Christian Otkjær on 09/12/16.
//  Copyright © 2016 Silverback IT. All rights reserved.
//

import Foundation

extension Calendar.Component
{
    var unit : NSCalendar.Unit
    {
        switch self
        {
        case .calendar:
            return .calendar
        case .timeZone:
            return .timeZone
            
        case .era:
            return .era
            
        case .year:
            return .year
            
        case .yearForWeekOfYear:
            return .yearForWeekOfYear
        case .weekOfYear:
            return .weekOfYear
            
        case .quarter:
            return .quarter
            
        case .month:
            return .month
            
        case .weekOfMonth:
            return .weekOfMonth
            
        case .weekdayOrdinal:
            return .weekdayOrdinal
            
        case .weekday:
            return .weekday
            
        case .day:
            return .day
            
        case .hour:
            return .hour
            
        case .minute:
            return .minute
            
        case .second:
            return .second
            
        case .nanosecond:
            return .nanosecond
        }
    }
    
    public init(_ unit: NSCalendar.Unit)
    {
        switch unit
        {
        case NSCalendar.Unit.calendar:
            self = .calendar
        case NSCalendar.Unit.timeZone:
            self = .timeZone
            
        case NSCalendar.Unit.era:
            self = .era
            
        case NSCalendar.Unit.year:
            self = .year
            
        case NSCalendar.Unit.yearForWeekOfYear:
            self = .yearForWeekOfYear
        case NSCalendar.Unit.weekOfYear:
            self = .weekOfYear
            
        case NSCalendar.Unit.quarter:
            self = .quarter
            
        case NSCalendar.Unit.month:
            self = .month
            
        case NSCalendar.Unit.weekOfMonth:
            self = .weekOfMonth
            
        case NSCalendar.Unit.weekdayOrdinal:
            self = .weekdayOrdinal
            
        case NSCalendar.Unit.weekday:
            self = .weekday
            
        case NSCalendar.Unit.day:
            self = .day
            
        case NSCalendar.Unit.hour:
            self = .hour
            
        case NSCalendar.Unit.minute:
            self = .minute
            
        case NSCalendar.Unit.second:
            self = .second
            
        case NSCalendar.Unit.nanosecond:
            self = .nanosecond
            
        default:
            self = .second
        }
    }
}
