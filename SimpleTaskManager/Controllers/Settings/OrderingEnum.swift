//
//  OrderingEnum.swift
//  SimpleTaskManager
//
//  Created by Tomas Baculák on 17/04/2018.
//  Copyright © 2018 Tomas Baculák. All rights reserved.
//

import Foundation

///
enum STMOrderingMannerEnum: Int, CaseIterable {
    case ascending = 0, descending
    
    var title: String {
        switch self {
        case .ascending: return "Ascending"
        case .descending: return "Descending"
        }
    }
    
    var actionBool: Bool {
        switch self {
        case .ascending: return true
        case .descending: return false
        }
    }
    
    static func manageOrdering(with row: Int) {
        UserDefaults.storeOrderingManner(with: row)
    }
    
    static var storedValue: STMOrderingMannerEnum {
        STMOrderingMannerEnum(rawValue: UserDefaults.getOrderingManner())!
    }
}
//
extension STMOrderingTypeEnum {
    static var managingParameter: String {
        storedValue == .date
            ? "taskDueDate"
            : "taskTitle"
    }
}
///
enum STMOrderingTypeEnum: Int, CaseIterable {
    case date = 0, name
    
    var title: String {
        switch self {
        case .date: return "By Due Date"
        case .name: return "By Name"
        }
    }
    
    static func manageOrdering(with row: Int) {
        UserDefaults.storeOrderingType(with: row)
    }
    
    static var storedValue: STMOrderingTypeEnum {
        STMOrderingTypeEnum(rawValue: UserDefaults.getOrderingType())!
    }
}
//
/// Persistancy
extension UserDefaults {
    private static let storageKeyManner = "STMOrderingManner"
    private static let storageKeyType = "STMOrderingType"
    
    fileprivate static func storeOrderingManner(with manner: Int) {
        standard.set(manner, forKey: storageKeyManner)
    }
    
    fileprivate static func storeOrderingType(with type: Int) {
        standard.set(type, forKey: storageKeyType)
    }
    
    fileprivate static func getOrderingManner() -> Int {
        standard.integer(forKey: storageKeyManner)
    }
    
    fileprivate static func getOrderingType() -> Int {
        standard.integer(forKey: storageKeyType)
    }
}
