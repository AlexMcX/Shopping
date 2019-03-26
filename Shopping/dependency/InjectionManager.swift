//
//  DependencyInjection.swift
//  Shopping
//
//  Created by Alexey Oleksandrovich on 3/26/19.
//  Copyright © 2019 Alexey Oleksandrovich. All rights reserved.
//

import Foundation

class InjectionManager {
    static let instance:InjectionManager = InjectionManager()
    
    private init() {}
    
    private var data:[String: InjectionProtocol] = [:]
    
    public func injection(injector:InjectionProtocol) {
        let property = Mirror(reflecting: injector).children
        
        for (key, value) in property {
            let valueType = type(of: value)
            
            guard let forKey = key else { continue }
            
            guard let inj =  getInjection(valueType) else { continue }
            
            (injector as! NSObject).setValue(inj, forKey: forKey)
        }
    }
    
    private func getInjection(_ opt: Any.Type) -> InjectionProtocol? {
        let className = (opt as Optional).subjectClassName
        
        guard let cls = NSClassFromString(className) as? NSObject.Type else { return nil }
        
        if cls.self is InjectionProtocol.Type {
            var result = data[className]
            
            if result == nil {
                result = cls.init() as? InjectionProtocol
                
                data[className] = result
                
                print("InjectionManager: create new Injection  - \(className)")
            }
            
            return result
        }
        
        return nil
    }
}
