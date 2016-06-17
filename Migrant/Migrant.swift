//
//  Migrant.swift
//  Migrant
//
//  Created by tomoponzoo on 2016/06/17.
//  Copyright © 2016年 tomoponzoo. All rights reserved.
//

import Foundation

public typealias MigrateBlock = (() -> Void)

public protocol Migratable {
	var migratable: Bool { get }
}

public protocol Migrator {
	var migrator: MigrateBlock { get }
}

public protocol MigrateTask: Migratable, Migrator {
}

public class MigrateBlockTask: MigrateTask {
	private let _migratable: Migratable
	private let _migrator: MigrateBlock
	
	public var migratable: Bool {
		return _migratable.migratable
	}
	
	public var migrator: MigrateBlock {
		return _migrator
	}
	
	public init(migratable: Migratable, migrator: MigrateBlock) {
		_migratable = migratable
		_migrator = migrator
	}
}

public class Migrant {
	
	private var tasks = [MigrateTask]()
	
    public init() {
    }
    
    public func set(task: MigrateTask) {
		tasks.append(task)
	}
	
	public func set(migratable: Migratable, migrator: MigrateBlock) {
		tasks.append(MigrateBlockTask(migratable: migratable, migrator: migrator))
	}
	
	public func migrate() {
        migrate { 
            for task in self.tasks {
                if !task.migratable {
                    continue
                }
                
                task.migrator()
            }
        }
	}
    
    private func migrate(block: () -> Void) {
        block()
        
        if let version = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as? String {
            Conf.sharedConfiguration.version = version
        }
    }
}
