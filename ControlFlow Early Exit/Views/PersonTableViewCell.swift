//
//  PersonTableViewCell.swift
//  ControlFlow Early Exit
//
//  Created by Wlad Dicario on 23/08/2015.
//  Copyright © 2015 Sweefties. All rights reserved.
//

import UIKit

protocol PersonTextCellDataSource {
    var title: String { get }
}

protocol PersonTextCellDelegate {
    var ageColor: UIColor { get }
    var textColor: UIColor { get }
    var font: UIFont { get }
}

extension PersonTextCellDelegate {
    
    var ageColor: UIColor {
        return .lightGrayColor()
    }
    
    var textColor: UIColor {
        return .blackColor()
    }
    
    var font: UIFont {
        return .systemFontOfSize(16)
    }
}


class PersonTableViewCell: UITableViewCell {
    
    private var delegate: PersonTextCellDelegate?
    private var dataObject: Person?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.detailTextLabel?.textColor = .lightGrayColor()
    }
    /**
    Configure the current Cell with data Object Model and delegate protocol.
    - parameter dataObject:     The Person Model object to layout.
    - parameter delegate:       The PersonTextCellDelegate optionnal protocol.
    - returns: The current Cell setted a new object model with `dataObject` from dataObject.
    */
    func configure(withDataSource dataObject: Person, delegate: PersonTextCellDelegate?) {
        self.dataObject = dataObject
        self.delegate = delegate
        
        let dateAsString = dataObject.age
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy/M/d H:mm:ss"
        let date = dateFormatter.dateFromString(dateAsString)
        
        self.textLabel?.text = "\(dataObject.userName)" + " \(dataObject.familyName)"
        self.detailTextLabel?.text = "\(FormattedTypeHelper.calculateAge(date!)) Years"
        
        self.textLabel?.font = delegate?.font
        self.textLabel?.textColor = delegate?.textColor
        self.detailTextLabel?.textColor = delegate?.ageColor
    }
}
