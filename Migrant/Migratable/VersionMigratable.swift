//
//  VersionMigratable.swift
//  Migrant
//
//  Created by tomoponzoo on 2016/06/17.
//  Copyright © 2016年 tomoponzoo. All rights reserved.
//

import Foundation

public class VersionMigratable: Migratable {
	
    public init() {
    }
    
	public var migratable: Bool {
        let oldVersion = Conf.sharedConfiguration.version
        let curVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString")
        
        if let oldVersion = oldVersion, let curVersion = curVersion as? String {
            return oldVersion < curVersion
        } else {
            return true
        }
	}
}
