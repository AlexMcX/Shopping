//
//  String.swift
//  Shopping
//
//  Created by Alexey Oleksandrovich on 3/26/19.
//  Copyright © 2019 Alexey Oleksandrovich. All rights reserved.
//

import Foundation

extension String {
    
    /*
         Example:
             self - "Swift.Optional<Project.Service>"
             from - "<"
             to - ">"
     
             return - "Project.Service"
     */
    func slice(from:String, to:String, removePrefixes:Bool = false) -> String {
        var result:String = self;
        
        guard let sIndex = self.index(of: from),
              let eIndex = self.endIndex(of: to)
        else { return self }
        
        result = self[sIndex..<eIndex]
        
        if removePrefixes {
            result = result[1..<result.count - 1]
        }
        
        return result;
    }
    
    subscript (value: Range<Int>) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: value.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: value.upperBound)
            
            return String(self[startIndex..<endIndex])
        }
    }
    
    subscript (value: ClosedRange<Int>) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: value.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: value.upperBound)
            
            return String(self[startIndex...endIndex])
        }
    }
    
    subscript (value: Range<String.Index>) -> String {
        get {
            let sDistance = self.distance(from: self.startIndex, to: value.lowerBound)
            let eDistance = self.distance(from: self.startIndex, to: value.upperBound)
            
            return String(self[sDistance..<eDistance])
        }
    }
}
