//
//  DependencyInjection.swift
//  Shopping
//
//  Created by Alexey Oleksandrovich on 3/26/19.
//  Copyright © 2019 Alexey Oleksandrovich. All rights reserved.
//

import Foundation

class InjectionManager: InjectionManagerProtocol {
    private enum ProtocolStatus {
        case PROTOCOL(instance:InjectionProtocol)
        case PROTOCOL_WAIT(className:String)
        case PROTOCOL_NONE
    }
    
    static let instance:InjectionManagerProtocol = InjectionManager()
    
    private init() {}
    
    // [className:Instance]
    private var data:[String: InjectionProtocol] = [:]
    
    // [className:wait this class [forKey:InjectionProtocol]]
    private var dataWait:[String: [(String, InjectionProtocol)]] = [:]
    
    private var injectionInit:[InjectionProtocol] = []
    
    public func injection(injector:InjectionProtocol) {
        var isInjection:Bool = true
        
        if (verificationInit(injector)) { return }
        injectionInit.append(injector)
        
        let property = Mirror(reflecting: injector).children
        
        print("       InjectionManager::injection \(injector)")
        
        for (key, value) in property {
            let valueType = type(of: value)
            
            guard let forKey = key else { continue }
            
            // init injection instance
            let injResult = getInjection(valueType)
            
            switch(injResult) {
                case .PROTOCOL_NONE:
                    continue
                case .PROTOCOL(let instance):
                    (injector as! NSObject).setValue(instance, forKey: forKey)
                case .PROTOCOL_WAIT(let className):
                    addWait(className, forKey, injector)
                
                    isInjection = false
            }
        }
    
        if (isInjection) {
            (injector as? InjectionHandlerProtocol)?.onInjection()
        }
    }
    
    public func registerInjection(injection:InjectionProtocol) {
        let className = getInjectionClassName(injection)
        var dispatch = [InjectionProtocol]()
        
        if let injectors = dataWait[className] {
            for (forKey, injector) in injectors {
                (injector as! NSObject).setValue(injection, forKey: forKey)
                
                dispatch.append(injector)
            }
            
            dataWait.removeValue(forKey: className)
            
            dispatchInjection(dispatch)
        }
    }
    
    private func getInjection(_ opt: Any.Type) -> ProtocolStatus {
        let className = (opt as Optional).subjectClassName
        let shotClassName = className.slice(from: ".", removePrefixes: true)
        
        // find in injection instance
        for inst in injectionInit {
            if (getInjectionClassName(inst) == shotClassName) {
                return .PROTOCOL(instance: inst)
            }
        }
        
        
        if !className.isPrefix(value: "Swift") {
            guard let cls = NSClassFromString(className) as? InjectionProtocol.Type else {
                guard let cls = NSClassFromString(shotClassName) as? InjectionProtocol.Type else {
                    return .PROTOCOL_NONE
                }
                
                return initInjection(cls)
            }
            
            return initInjection(cls)
        }
        
        return .PROTOCOL_NONE
    }
    
    private func initInjection(_ cls: InjectionProtocol.Type) -> ProtocolStatus {
        let className:String = String(describing: cls)
        
        var result = data[className]

        if result == nil {
            if (cls is InjectionInstanceProtocol.Type) {
                return .PROTOCOL_WAIT(className: className)
            }
            
            result = (cls as! NSObject.Type).init() as? InjectionProtocol
            
            addData(instance: result!)
        }

        return .PROTOCOL(instance:result!)
    }
    
    private func addWait(_ className: String, _ forKey: String, _ injector: InjectionProtocol) {
        if (dataWait[className] == nil) {
            dataWait[className] = [(String, InjectionProtocol)]()
        }
        
        dataWait[className]?.append((forKey, injector))
    }
    
    private func addData(instance: InjectionProtocol) {
        let className = getInjectionClassName(instance)
        
        if (data[className] != nil) { return }
        
        data[className] = instance
    }
    
    
    private func dispatchInjection(_ injectors: [InjectionProtocol]) {
        for injector in injectors {
            dispatchInjection(injector)
        }
    }
    
    private func dispatchInjection(_ injector: InjectionProtocol) {
        for (_, wait) in dataWait {
            for (_, instance) in wait {
                if (injector.isEqual(instance)) {
                    return
                }
            }
        }
        
        (injector as? InjectionHandlerProtocol)?.onInjection()
    }
    
    
    
    private func getInjectionClassName(_ instance: InjectionProtocol) -> String {
        return String(describing: Mirror(reflecting: instance).subjectType)
    }
    
    private func verificationInit(_ instance: InjectionProtocol) -> Bool {
        for inst in injectionInit {
            if (inst.isEqual(instance)) { return true }
        }
        
        return false
    }
}
