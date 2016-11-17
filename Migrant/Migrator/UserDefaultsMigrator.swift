//
//  UserDefaultsMigrator.swift
//  Migrant
//
//  Created by tomoki.koga@bizreach.co.jp on 2016/06/17.
//  Copyright © 2016年 tomoponzoo. All rights reserved.
//

import Foundation

public protocol UserDefaultsMigrator {
    var userDefaults: UserDefaults { get }
}

public extension UserDefaultsMigrator {
    
    public func migrateForObject(_ fromKey: UserDefaultsKey, toKey: UserDefaultsKey) {
        if let object = userDefaults.object(forKey: fromKey.key) {
            userDefaults.set(object, forKey: toKey.key)
        }
        obsolete(fromKey)
    }
    
    public func migrateForInt(_ fromKey: UserDefaultsKey, toKey: UserDefaultsKey) {
        userDefaults.set(userDefaults.integer(forKey: fromKey.key), forKey: toKey.key)
        obsolete(fromKey)
    }
    
    public func migrateForBool(_ fromKey: UserDefaultsKey, toKey: UserDefaultsKey) {
        userDefaults.set(userDefaults.bool(forKey: fromKey.key), forKey: toKey.key)
        obsolete(fromKey)
    }
    
    public func migrateForDouble(_ fromKey: UserDefaultsKey, toKey: UserDefaultsKey) {
        userDefaults.set(userDefaults.double(forKey: fromKey.key), forKey: toKey.key)
        obsolete(fromKey)
    }
    
    public func migrateForFloat(_ fromKey: UserDefaultsKey, toKey: UserDefaultsKey) {
        userDefaults.set(userDefaults.float(forKey: fromKey.key), forKey: toKey.key)
        obsolete(fromKey)
    }
    
    public func migrateForURL(_ fromKey: UserDefaultsKey, toKey: UserDefaultsKey) {
        migrateForObject(fromKey, toKey: toKey)
    }
    
    public func obsolete(_ key: UserDefaultsKey) {
        userDefaults.removeObject(forKey: key.key)
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
