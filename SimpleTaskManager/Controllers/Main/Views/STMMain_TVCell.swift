//
//  STMMain_TVCell.swift
//  SimpleTaskManager
//
//  Created by Tomas Baculák on 16/04/2018.
//  Copyright © 2018 Tomas Baculák. All rights reserved.
//

import UIKit
///
class STMMain_TVCell: STMConfirmButton_TVCell {
    //
    @IBOutlet var titelLabel: UILabel!
    //
    @IBOutlet var dueDateLabel: UILabel!
    //
    override var theTaskRecord: STMRecord? {
        didSet {
            titelLabel.text = theTaskRecord?.taskTitle
            dueDateLabel.text = theTaskRecord?.taskDueDate?.returnString(with: .long)
            formatButton()
        }
    }
}
