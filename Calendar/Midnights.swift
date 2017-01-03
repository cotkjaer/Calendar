//
//  Midnights.swift
//  Calendar
//
//  Created by Christian Otkjær on 03/01/17.
//  Copyright © 2017 Silverback IT. All rights reserved.
//

import Foundation

// MARK: - midnights

extension Calendar
{
    /**
     Calculates the number og midnights between two date-times
     - parameter firstDateTime: the date to start counting, defaults to today
     - parameter lastDateTime: the date to end counting
     - returns: the number of midnights between the given date-times
     - note: If firstDateTime is after lastDateTime the result may be negative
     */
    public func midnights(from firstDateTime: Date = Date(), until lastDateTime: Date) -> Int
    {
        let firstStartOfDay = startOfDay(for: firstDateTime)
        let lastStartOfDay = startOfDay(for: lastDateTime)
        
        return Int(lastStartOfDay.timeIntervalSince(firstStartOfDay)/(60*60*24))
    }
}

