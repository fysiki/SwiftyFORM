// MIT license. Copyright (c) 2016 SwiftyFORM. All rights reserved.
import SwiftyFORM

class PickerViewViewController: FormViewController {
	override func populate(builder: FormBuilder) {
		builder.navigationTitle = "PickerViews"
		builder += SectionHeaderTitleFormItem().title("PickerView")
		builder += picker0
		builder += picker1
		builder += picker2
		builder += SectionHeaderTitleFormItem().title("Buttons")
		builder += randomizeButton
	}
	
	lazy var picker0: PickerViewFormItem = {
		let instance = PickerViewFormItem().title("1 component").behavior(.Expanded)
		instance.pickerTitles = [["0", "1", "2", "3", "4", "5", "6"]]
		return instance
	}()
	
	lazy var picker1: PickerViewFormItem = {
		let instance = PickerViewFormItem().title("2 components")
		instance.pickerTitles = [["00", "01", "02", "03"], ["10", "11", "12", "13", "14"]]
		return instance
	}()
	
	lazy var picker2: PickerViewFormItem = {
		let instance = PickerViewFormItem().title("3 components")
		instance.pickerTitles = [["00", "01"], ["10", "11"], ["20", "21"]]
		return instance
	}()

	lazy var randomizeButton: ButtonFormItem = {
		let instance = ButtonFormItem()
		instance.title("Randomize")
		instance.action = { [weak self] in
			self?.randomize()
		}
		return instance
	}()
	
	func assignRandomValues(pickerView: PickerViewFormItem) {
		var selectedRows = [Int]()
		for rows in pickerView.pickerTitles {
			if rows.count > 0 {
				selectedRows.append(randomInt(0, rows.count-1))
			} else {
				selectedRows.append(-1)
			}
		}
		pickerView.setValue(selectedRows, animated: true)
	}
	
	func randomize() {
		assignRandomValues(picker0)
		assignRandomValues(picker1)
		assignRandomValues(picker2)
	}
}
