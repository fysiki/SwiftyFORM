//
//  CustomizableButton 2.swift
//  SwiftyFORM
//
//  Created by Benoit Deldicque on 03/09/2025.
//  Copyright © 2025 Simon Strandgaard. All rights reserved.
//


// MIT license. Copyright (c) 2021 SwiftyFORM. All rights reserved.
import UIKit

public protocol CustomizableAccessoryType {
    var accessoryType: UITableViewCell.AccessoryType { get set }
}

public extension CustomizableAccessoryType where Self: FormItem {

    @discardableResult
    func accessoryType(_ type: UITableViewCell.AccessoryType) -> Self {
        var instance = self
        instance.accessoryType = type
        return instance
    }
    
}
