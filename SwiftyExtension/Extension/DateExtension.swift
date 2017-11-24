//
//  NSDateExtension.swift
//  GoldenTime
//
//  Created by Nguyen Khoi Nguyen on 11/8/16.
//  Copyright © 2016 CAN. All rights reserved.
//

import UIKit

public extension String{
    /*
    Convert string to date
     **/
    func date(with custom: String) -> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = custom
        
        return dateFormatter.date(from: self)
    }
}


public extension Date{
    
    /*
     convert date to string
    **/
    func dateToString(with custom: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = custom
        return dateFormatter.string(from: self)
    }
    
    /*
     get hour
    **/
    var hour: Int{
        return self.component.h
    }
    
    /*
     get minute
     **/
    var minute: Int{
        return self.component.m
    }
    
    /*
     get second
     **/
    var second: Int{
        return self.component.s
    }
    
    var component: (h: Int, m: Int, s: Int){
        let calendar = Calendar.current
        let comp = calendar.dateComponents([.hour, .minute, .second], from: self)
        let hour = comp.hour ?? 0
        let minute = comp.minute ?? 0
        let second = comp.second ?? 0
        return (hour, minute, second)
    }
    
    func add(value: Int, to component: Calendar.Component) -> Date?{
        var dateComponent = DateComponents()
        
        switch component {
        case .second:
            dateComponent.second = value
        case .minute:
            dateComponent.minute = value
        case .hour:
            dateComponent.hour = value
        case .day:
            dateComponent.day = value
        case .month:
            dateComponent.month = value
        case .year:
            dateComponent.year = value
        default: break
        }
        
        return Calendar.current.date(byAdding: dateComponent, to: self)
    }
}
