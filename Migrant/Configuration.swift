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
    
    let ud = UserDefaults.standard
    
    var version: String? {
        get { return ud.string(forKey: Keys.version.rawValue) }
        set { sync { self.ud.set(newValue, forKey: Keys.version.rawValue) } }
    }
    
    func sync(_ block: () -> Void) {
        block()
        ud.synchronize()
    }
}
