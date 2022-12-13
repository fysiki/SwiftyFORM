// MIT license. Copyright (c) 2021 SwiftyFORM. All rights reserved.
import Foundation

public protocol AssignAppearance {
    var isUsingTintColor: Bool { get set }
	func assignDefaultColors()
	func assignTintColors()
}
