//
//  dropDownView.swift
//  DropDown
//
//  Created by Elliot Glaze on 04/03/2019.
//  Copyright © 2019 Elliot Glaze. All rights reserved.
//

import UIKit

class dropDownView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var dropDownOptions = [String]()
    var tableView = UITableView()
    var delegate : DropDownProtocol!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor.darkGray
        self.backgroundColor = UIColor.darkGray
        
        self.addSubview(tableView)
        
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
            ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropDownOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        cell.textLabel?.text = dropDownOptions[indexPath.row]
        cell.backgroundColor = UIColor.darkGray
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate.dropDownPressed(string: dropDownOptions[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
