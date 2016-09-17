//
//  PersonViewModel.swift
//  ControlFlow Early Exit
//
//  Created by Wlad Dicario on 23/08/2015.
//  Copyright © 2015 Sweefties. All rights reserved.
//

import UIKit

struct PersonViewModel: PersonTextCellDataSource {
    var title = "Person Index"
}

extension PersonViewModel: PersonTextCellDelegate {
    
    var ageColor: UIColor {
        return UIColor.lightGray
    }
}
