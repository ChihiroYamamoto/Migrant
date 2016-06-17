//
//  BoolMigratable.swift
//  Migrant
//
//  Created by tomoponzoo on 2016/06/17.
//  Copyright © 2016年 tomoponzoo. All rights reserved.
//

import Foundation

extension Bool: Migratable {
    
    public var migratable: Bool {
        return self
    }
}