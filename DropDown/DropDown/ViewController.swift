//
//  ViewController.swift
//  DropDown
//
//  Created by Elliot Glaze on 04/03/2019.
//  Copyright © 2019 Elliot Glaze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var button = dropDownButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButton()
        
        
        
    }
    
    func setupButton() {
        button = dropDownButton.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        button.setTitle("Colour", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.dropView.dropDownOptions = ["One", "Two", "Three"]
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.heightAnchor.constraint(equalToConstant: 40)
            ])
    }


}
protocol DropDownProtocol {
    func dropDownPressed(string : String)
}

