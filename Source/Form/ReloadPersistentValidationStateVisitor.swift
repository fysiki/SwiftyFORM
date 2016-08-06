// MIT license. Copyright (c) 2014 SwiftyFORM. All rights reserved.
import Foundation

class ReloadPersistentValidationStateVisitor: FormItemVisitor {
	
	class func validateAndUpdateUI(items: [FormItem]) {
		let visitor = ReloadPersistentValidationStateVisitor()
		for item in items {
			item.accept(visitor)
		}
	}
	
	func visit(object: MetaFormItem) {}
	func visit(object: CustomFormItem) {}
	func visit(object: StaticTextFormItem) {}
	func visit(object: AttributedTextFormItem) {}
	
	func visit(object: TextFieldFormItem) {
		object.reloadPersistentValidationState()
	}
	
	func visit(object: TextViewFormItem) {}
	func visit(object: ViewControllerFormItem) {}
	func visit(object: OptionPickerFormItem) {}
	func visit(object: DatePickerFormItem) {}
	func visit(object: ButtonFormItem) {}
	func visit(object: OptionRowFormItem) {}
	func visit(object: SwitchFormItem) {}
	func visit(object: StepperFormItem) {}
	func visit(object: SliderFormItem) {}
	func visit(object: PrecisionSliderFormItem) {}
	func visit(object: SectionFormItem) {}
	func visit(object: SectionHeaderTitleFormItem) {}
	func visit(object: SectionHeaderViewFormItem) {}
	func visit(object: SectionFooterTitleFormItem) {}
	func visit(object: SectionFooterViewFormItem) {}
	func visit(object: SegmentedControlFormItem) {}
}
