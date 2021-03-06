//
//  STMOrderingPicker_TVCell.swift
//  SimpleTaskManager
//
//  Created by Tomas Baculák on 17/04/2018.
//  Copyright © 2018 Tomas Baculák. All rights reserved.
//

import UIKit

///
extension STMOrderingPicker_TVCell: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        viewModel.numberOfPickerComponents
    }

    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        viewModel.numberOfPickerRows
    }
}
///
extension STMOrderingPicker_TVCell: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView,
                    viewForRow row: Int,
                    forComponent component: Int,
                    reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.textAlignment = .center
        label.text = viewModel.loadTitles(with: row, component: component)
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        viewModel.updateOrdering(with: row, component: component)
    }
}

class STMOrderingPicker_TVCell: UITableViewCell {
    @IBOutlet weak var picker: UIPickerView! {
        didSet {
            picker.delegate = self
            picker.dataSource = self
        }
    }
    
    private var viewModel: STMSettings_VM!
    
    func configure(with viewModel: STMSettings_VM) {
        self.viewModel = viewModel
        
        viewModel.initialPickerValues
            .forEach{ picker.selectRow($0.row,
                                       inComponent: $0.component,
                                       animated: true) }
    }
}
