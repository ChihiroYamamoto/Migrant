//
//  UserDefaultsMigrator.swift
//  Migrant
//
//  Created by tomoki.koga@bizreach.co.jp on 2016/06/17.
//  Copyright © 2016年 tomoponzoo. All rights reserved.
//

import Foundation

public protocol UserDefaultsMigrator {
    var userDefaults: NSUserDefaults { get }
}

public extension UserDefaultsMigrator {
    
    public func migrateForObject(fromKey: UserDefaultsKey, toKey: UserDefaultsKey) {
        if let object = userDefaults.objectForKey(fromKey.key) {
            userDefaults.setObject(object, forKey: toKey.key)
        }
        obsolete(fromKey)
    }
    
    public func migrateForInt(fromKey: UserDefaultsKey, toKey: UserDefaultsKey) {
        userDefaults.setInteger(userDefaults.integerForKey(fromKey.key), forKey: toKey.key)
        obsolete(fromKey)
    }
    
    public func migrateForBool(fromKey: UserDefaultsKey, toKey: UserDefaultsKey) {
        userDefaults.setBool(userDefaults.boolForKey(fromKey.key), forKey: toKey.key)
        obsolete(fromKey)
    }
    
    public func migrateForDouble(fromKey: UserDefaultsKey, toKey: UserDefaultsKey) {
        userDefaults.setDouble(userDefaults.doubleForKey(fromKey.key), forKey: toKey.key)
        obsolete(fromKey)
    }
    
    public func migrateForFloat(fromKey: UserDefaultsKey, toKey: UserDefaultsKey) {
        userDefaults.setFloat(userDefaults.floatForKey(fromKey.key), forKey: toKey.key)
        obsolete(fromKey)
    }
    
    public func migrateForURL(fromKey: UserDefaultsKey, toKey: UserDefaultsKey) {
        migrateForObject(fromKey, toKey: toKey)
    }
    
    public func obsolete(key: UserDefaultsKey) {
        userDefaults.removeObjectForKey(key.key)
    }
}

public protocol UserDefaultsKey {
    var key: String { get }
}

extension String: UserDefaultsKey {
    
    public var key: String {
        return self
    }
}
