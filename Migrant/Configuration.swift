//
//  Configuration.swift
//  Migrant
//
//  Created by tomoponzoo on 2016/06/17.
//  Copyright © 2016年 tomoponzoo. All rights reserved.
//

import Foundation

typealias Conf = Configuration

class Configuration {
    enum Keys: String {
        case version = "Migrant.App.Version"
    }
    
    static let sharedConfiguration = Configuration()
    
    let ud = NSUserDefaults.standardUserDefaults()
    
    var version: String? {
        get { return ud.stringForKey(Keys.version.rawValue) }
        set { sync { self.ud.setObject(newValue, forKey: Keys.version.rawValue) } }
    }
    
    func sync(block: () -> Void) {
        block()
        ud.synchronize()
    }
}