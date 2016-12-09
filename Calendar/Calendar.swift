//
//  Calendar.swift
//  Calendar
//
//  Created by Christian Otkjær on 09/12/16.
//  Copyright © 2016 Silverback IT. All rights reserved.
//

import Foundation

// MARK: - Hashable

extension NSCalendar.Unit : Hashable
{
    public var hashValue : Int { return Int(bitPattern: rawValue) }
}

public extension Calendar
{
    func days(between fromDateTime: Date, and toDateTime: Date) -> Int
    {
        let components = dateComponents([Calendar.Component.day], from: fromDateTime, to: toDateTime)
        
        return components.day ?? 0
    }
    
    /// Returns the first moment in the given component for the given `Date`, as a `Date`.
    ///
    /// For example, pass in `.hour` and `Date()`, if you want the start of the current hour.
    /// - parameter component: the component to round to
    /// - parameter date: The date to search
    /// - returns: The first moment of the given component in the given date.
    /// - note: if `component` should be in [.era, .year, .month, .day, .hour, .minute, .second], if not `date` is returned unchanged
    public func start(of component: Calendar.Component, for date: Date) -> Date
    {
        return start(of: component, for: date as Date?) ?? date
    }
    
    public func start(of component: Calendar.Component, for date: Date?) -> Date?
    {
        guard let date = date else { return nil }
        
        var c = dateComponents([.era, .year, .month, .day, .hour, .minute, .second], from: date)
        
        switch component
        {
        case .era:
            c.year = range(of: .year, in: .era, for: date)?.lowerBound
            fallthrough
            
        case .year:
            c.month = range(of: .month, in: .year, for: date)?.lowerBound
            fallthrough
            
        case .month:
            c.day = range(of: .day, in: .month, for: date)?.lowerBound
            fallthrough
            
        case .day:
            c.hour = range(of: .hour, in: .day, for: date)?.lowerBound
            fallthrough
            
        case .hour:
            c.minute = range(of: .minute, in: .hour, for: date)?.lowerBound
            fallthrough
            
        case .minute:
            c.second = range(of: .second, in: .minute, for: date)?.lowerBound
            fallthrough
            
        case .second:
            c.nanosecond = 0
            return self.date(from: c)
            
        default:
            debugPrint("Cannot round \(component)")

            return date
        }
    }

    /// "Rounds" the given `date` upwards to the the earliest Date with all components smaller than `component` set to 0, so that `next(component, for: date)` is later than `date`
    /// - parameter component : The component to round to
    /// - parameter date : An optional date from where to start the search - defaults to `Date()`
    /// - returns : `date` rounded down to `component` and then incremented by one `component`
    /// - note: cannot be used with `.era`
    func next(_ component: Calendar.Component, for date: Date? = Date()) -> Date?
    {
        guard let roundedDate = date?.start(of: component, calendar: self) else { return nil }
        
        return self.date(byAdding: component, value: 1, to: roundedDate)
    }
    
    func next(_ component: Calendar.Component, for date: Date) -> Date
    {
        return next(component, for: date as Date?) ?? date
    }
}
