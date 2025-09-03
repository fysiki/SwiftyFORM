// MIT license. Copyright (c) 2021 SwiftyFORM. All rights reserved.
import UIKit

public struct ButtonCellModel {
	var title: String = ""
    var titleFont: UIFont = UIFont.preferredFont(forTextStyle: .body)
    var textAlignment: NSTextAlignment = .center
    var titleTextColor: UIColor = Colors.text
    var tintTitleText: Bool = true
    var backgroundColor: UIColor? = nil
    var accessoryType: UITableViewCell.AccessoryType = .none

    var action: (_ frame: CGRect) -> Void = { _ in
		SwiftyFormLog("action")
	}

}

public class ButtonCell: UITableViewCell, SelectRowDelegate, AssignAppearance {
	public let model: ButtonCellModel

	public init(model: ButtonCellModel) {
		self.model = model
		super.init(style: .default, reuseIdentifier: nil)
		loadWithModel(model)

        isUsingTintColor = model.tintTitleText

        if isUsingTintColor == false {
            assignDefaultColors()
        } else {
            assignTintColors()
        }
	}

	public required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	public func loadWithModel(_ model: ButtonCellModel) {
		textLabel?.text = model.title
        textLabel?.font = model.titleFont
        textLabel?.textAlignment = model.textAlignment
        backgroundColor = model.backgroundColor
        accessoryType = model.accessoryType
	}

	public func form_didSelectRow(indexPath: IndexPath, tableView: UITableView) {
		// hide keyboard when the user taps this kind of row
		tableView.form_firstResponder()?.resignFirstResponder()

        let rectInTableView = tableView.rectForRow(at: indexPath)

        if let vc = tableView.parentViewController() {
            // Convert it to the coordinate system of the controller's main view
            let rectInSuperview = tableView.convert(rectInTableView, to: vc.view)
            model.action(rectInSuperview)
        }


		tableView.deselectRow(at: indexPath, animated: true)
	}

    public var isUsingTintColor: Bool = true

    public func assignDefaultColors() {
        isUsingTintColor = false
        textLabel?.textColor = model.titleTextColor
    }
    
    public func assignTintColors() {
        isUsingTintColor = true
        textLabel?.textColor = tintColor
    }

    public override func tintColorDidChange() {
        super.tintColorDidChange()
        if isUsingTintColor == true { assignTintColors() }
    }
}

extension UIView {
    func parentViewController() -> UIViewController? {
        var responder: UIResponder? = self
        while let r = responder {
            if let vc = r as? UIViewController {
                return vc
            }
            responder = r.next
        }
        return nil
    }
}
