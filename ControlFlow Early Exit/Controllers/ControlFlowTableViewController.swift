//
//  ControlFlowTableViewController.swift
//  ControlFlow Early Exit
//
//  Created by Wlad Dicario on 23/08/2015.
//  Copyright © 2015 Sweefties. All rights reserved.
//

import UIKit

class ControlFlowTableViewController: UITableViewController {

    // data for the table.
    dynamic var dataArray = [Person]()
    
    fileprivate enum DataLayer: Int {
        case manager
        case employees
    }
    // cell
    fileprivate let textCellIdentifier = "defaultCell"
    
    // render
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setNewDatas()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

private typealias TableViewDataSource = ControlFlowTableViewController
extension TableViewDataSource {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count 
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Control Flow - Early Exit Example with guard 'late let' example..
        let identifier: String = {
            guard let type = DataLayer(rawValue: (indexPath as NSIndexPath).row) else { return textCellIdentifier }
            switch type {
            case .manager: return textCellIdentifier
            case .employees: return textCellIdentifier
            }
            }()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! PersonTableViewCell
        
        // Now with Early Exit.
        guard let person : Person = dataArray[(indexPath as NSIndexPath).row] as Person? else { print("no value") }
        
        let viewModel = PersonViewModel()
        cell.configure(withDataSource: person, delegate: viewModel)
        
        // Before swift 2
        /*if let person: Person = dataArray[indexPath.row] as Person {
            // Then force downcast.
            let viewModel = PersonViewModel()
            cell.configure(withDataSource: person, delegate: viewModel)
            return cell
        }*/
        return cell
    }
    
}

private typealias TableViewDelegate = ControlFlowTableViewController
extension TableViewDelegate {
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64.0
    }
}

private typealias UIStylingHelpers = ControlFlowTableViewController
extension UIStylingHelpers {
    // UI styling
    func setUI() {
        // set custom style
        self.tableView.tableFooterView = UIView()
        self.tableView.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 244/255, alpha: 1.0)
        // set row height
        self.tableView.rowHeight = 64.0
        self.tableView.estimatedRowHeight = UITableViewAutomaticDimension
    }
}

private typealias DataSetted = ControlFlowTableViewController
extension DataSetted {
    // set Datas
    func setNewDatas() {
        dataArray.append(Person(userName: "John", familyName: "Doe", age: "1957-01-03 01:44:14"))
        dataArray.append(Person(userName: "Sarah", familyName: "Yayvo", age: "1979-05-14 01:44:14"))
        dataArray.append(Person(userName: "Shanda", familyName: "Lear", age: "1995-08-22 01:44:14"))
        dataArray.append(Person(userName: "Heidi", familyName: "Clare", age: "1983-02-23 01:44:14"))
        dataArray.append(Person(userName: "Helen", familyName: "Back", age: "1932-01-03 01:44:14"))
        dataArray.append(Person(userName: "Jack", familyName: "Haas", age: "1978-01-03 01:44:14"))
        dataArray.append(Person(userName: "Justin", familyName: "Case", age: "1927-01-03 01:44:14"))
        dataArray.append(Person(userName: "Ophelia", familyName: "Payne", age: "1903-01-03 01:44:14"))
        dataArray.append(Person(userName: "Justin", familyName: "Case", age: "1968-01-03 01:44:14"))
        dataArray.append(Person(userName: "Paige", familyName: "Turner", age: "1990-01-03 01:44:14"))
        dataArray.append(Person(userName: "Rick", familyName: "O'Shea", age: "1945-01-03 01:44:14"))
        dataArray.append(Person(userName: "Rick", familyName: "Shaw", age: "1988-01-03 01:44:14"))
        dataArray.append(Person(userName: "Sal", familyName: "Minella", age: "1947-01-03 01:44:14"))
        dataArray.append(Person(userName: "Seth", familyName: "Poole", age: "1910-01-03 01:44:14"))
        dataArray.append(Person(userName: "Russell", familyName: "Leeves", age: "1943-01-03 01:44:14"))
        dataArray.append(Person(userName: "Sonny", familyName: "Day", age: "1880-01-03 01:44:14"))
        dataArray.append(Person(userName: "Stan", familyName: "Still", age: "1702-01-03 01:44:14"))
        dataArray.append(Person(userName: "Stanley", familyName: "Cupp", age: "1434-01-03 01:44:14"))
        dataArray.append(Person(userName: "Sue", familyName: "Flay", age: "2000-01-03 01:44:14"))
        dataArray.append(Person(userName: "Tim", familyName: "Burr", age: "2014-08-23 01:44:14"))
    }
}
