//
//  CalculateAge.swift
//  ControlFlow Early Exit
//
//  Created by Wlad Dicario on 23/08/2015.
//  Copyright © 2015 Sweefties. All rights reserved.
//

import Foundation

class FormattedTypeHelper {
    /**
    Calculated Age Integer for NSDate eg: 18 years
    - parameter birthday:     The NSDate to transform.
    - returns: A new Age NSInteger with `birthday` from NSDate.
    */
    class func calculateAge (_ birthday: Date) -> NSInteger {
        
        let calendar : Calendar = Calendar.current
        let dateComponentNow : DateComponents = (calendar as NSCalendar).components([.year, .month, .day, .hour], from: Date())
        let dateComponentBirth : DateComponents = (calendar as NSCalendar).components([.year, .month, .day, .hour], from: birthday)
        
        if ( (dateComponentNow.month! < dateComponentBirth.month!) ||
            ((dateComponentNow.month! == dateComponentBirth.month!) && (dateComponentNow.day! < dateComponentBirth.day!))
            )
        {
            return dateComponentNow.year! - dateComponentBirth.year! - 1
        }
        else {
            return dateComponentNow.year! - dateComponentBirth.year!
        }
    }
    
}
