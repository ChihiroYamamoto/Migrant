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

open class MigrateBlockTask: MigrateTask {
	private let _migratable: Migratable
	private let _migrator: MigrateBlock
	
	open var migratable: Bool {
		return _migratable.migratable
	}
	
	open var migrator: MigrateBlock {
		return _migrator
	}
	
	public init(migratable: Migratable, migrator: @escaping MigrateBlock) {
		_migratable = migratable
		_migrator = migrator
	}
}

public class Migrant {
	
	private var tasks = [MigrateTask]()
	
    public init() {
    }
    
    public func set(_ task: MigrateTask) {
		tasks.append(task)
	}
	
	public func set(_ migratable: Migratable, migrator: @escaping MigrateBlock) {
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
    
    private func migrate(_ block: () -> Void) {
        block()
        
        if let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String {
            Conf.sharedConfiguration.version = version
        }
    }
}
