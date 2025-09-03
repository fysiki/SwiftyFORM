// MIT license. Copyright (c) 2021 SwiftyFORM. All rights reserved.
import UIKit

public class ButtonFormItem: FormItem, CustomizableTitleLabel, CustomizableButton, CustomizableAccessoryType {


	override func accept(visitor: FormItemVisitor) {
		visitor.visit(object: self)
	}

	public var title: String = ""
    
    public var titleTextColor: UIColor = Colors.text

    public var useTintColor: Bool = true
    
    public var titleFont: UIFont = UIFont.preferredFont(forTextStyle: .body)

    public var textAlignment: NSTextAlignment = .center
    
    public var backgroundColor: UIColor? = nil

    public var action: (_ frame: CGRect) -> Void = { _ in }

    public var accessoryType: UITableViewCell.AccessoryType = .none

}
